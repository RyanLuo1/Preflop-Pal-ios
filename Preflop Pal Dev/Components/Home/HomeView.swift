//
//  HomeView.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/11/25.
//

import SwiftUI

struct Range {
    let hands: [String]
    
    func contains(_ hand: Hand) -> Bool {
        return hands.contains(hand.toKey())
    }
}

struct RFIThreeBetRange {
    let callRange: Range
    let rcRange: Range // raise/call mix
    let fcRange: Range // fold/call mix
    let valueRange: Range
    let bluffRange: Range
}

struct FacingThreeBetRange {
    let callRange: Range
    let rcRange: Range
    let fourBetValueRange: Range
    let fourBetBluffRange: Range
}

struct FacingFourBetRange {
    let callRange: Range
    let allInRange: Range
    let bluffRange: Range
}

struct Card: CustomStringConvertible {
    let rank: Character
    let suit: Character
    
    var description: String {
        return "\(rank)\(suit)"
    }
}

struct Hand {
    let card1: Card
    let card2: Card
    
    var isSuited: Bool {
        return card1.suit == card2.suit
    }
    
    var isPair: Bool {
        return card1.rank == card2.rank
    }
    
    private let rankOrder = "AKQJT98765432"
    
    func toKey() -> String {
        let (highCard, lowCard) = rankOrder.firstIndex(of: card1.rank)! <= rankOrder.firstIndex(of: card2.rank)! ? (card1, card2) : (card2, card1)
        
        if isPair {
            return "\(highCard.rank)\(lowCard.rank)"
        } else if isSuited {
            return "\(highCard.rank)\(lowCard.rank)s"
        } else {
            return "\(highCard.rank)\(lowCard.rank)o"
        }
    }
}

struct HandRecord: Codable {
    var id = UUID().uuidString
    let card1: String
    let card2: String
    let tableSize: String
    let position: String
    let previousAction: String
    let advice: String
    var timestamp: Int = (Int(Date().timeIntervalSince1970)*1000)
    
    var toDictionary: [String: Any] {
        return [
            "id": id,
            "card1": card1,
            "card2": card2,
            "tableSize": tableSize,
            "position": position,
            "previousAction": previousAction,
            "advice": advice,
            "timestamp": timestamp
        ]
    }
}

enum Suit: String {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
    
    var isRed: Bool {
        switch self {
        case .hearts, .diamonds:
            return true
        default:
            return false
        }
    }
}

enum ActionType: String {
    case fold = "Fold"
    case raise = "Raise"
    case call = "Call"
    case threeBet = "3Bet"
    case fourBet = "4Bet"
    case allIn = "All In"
    
    var isRaise: Bool {
        return [.raise, .threeBet, .fourBet, .allIn].contains(self)
    }
    
    func isHigherRaise(than other: ActionType) -> Bool {
        if self == .allIn {
            return other != .allIn
        }
        else if self == .fourBet {
            return ![.allIn, .fourBet].contains(other)
        }
        else if self == .threeBet {
            return ![.allIn, .fourBet, .threeBet].contains(other)
        }
        return false
    }
}

struct Action: Identifiable, Equatable {
    let id = UUID().uuidString
    let position: String
    var action: ActionType?
    var actionOptions: [ActionType]
}

class HomeViewModel: ObservableObject {
    
    let logout: () -> Void
    
    init(logout: @escaping () -> Void) {
        self.logout = logout
    }
    
    static let positions6 = [
        "UTG",
        "MP",
        "CO",
        "BTN",
        "SB",
        "BB"
    ]
    
    static let positions9 = [
        "UTG",
        "UTG+1",
        "UTG+2",
        "LJ",
        "HJ",
        "CO",
        "BTN",
        "SB",
        "BB"
    ]
    
    // 6max ranges (your existing ones)
    private let SIX_MAX_RFI_RANGES = SixMaxRFIRanges.ranges
    private let SIX_MAX_THREE_BET_RANGES = SixMaxRFIThreeBetRanges.ranges
    private let SIX_MAX_FACING_THREE_BET_RANGES = SixMaxFacingThreeBetRanges.ranges

    // 9max ranges (placeholders - you'll implement these)
    private let NINE_MAX_RFI_RANGES = NineMaxRFIRanges.ranges
    private let NINE_MAX_THREE_BET_RANGES = NineMaxRFIThreeBetRanges.ranges
    private let NINE_MAX_FACING_THREE_BET_RANGES = NineMaxFacingThreeBetRanges.ranges
    
    @Published var tableSize6Players = false { didSet {
        yourPosition = nil
        resetPreviousActions()
    }}
    
    @Published var card1Suit: Suit = .spades
    @Published var card1Rank: String = "A"
    
    @Published var card2Suit: Suit = .hearts
    @Published var card2Rank: String = "K"
    
    @Published var card1SelectionIsPresented: Bool = false
    @Published var card2SelectionIsPresented: Bool = false
    
    @Published var yourPosition: String?
    
    @Published var previousActionText: String?
    @Published var previousActions: [Action] = []
    
    @Published var advice: String = ""
    @Published var explanation: String = ""
    @Published var handStrength: Double = 0.0
    @Published var adviceIsPresented: Bool = false
    
    @Published var errorMessage: String = ""
    
    func setPosition(_ position: String) {
        yourPosition = position
        resetPreviousActions()
        refreshActions()
    }
    
    func resetPreviousActions() {
        previousActions.removeAll()
        previousActionText = nil
    }
    
    func refreshActions() {
        if previousActions.isEmpty {
            
            /// Fill in up until user's position
            for position in tableSize6Players ? Self.positions6 : Self.positions9 {
                let action = Action(
                    position: position,
                    action: position == yourPosition ? nil : .fold,
                    actionOptions: [.fold, .raise]
                )
                previousActions.append(action)
                if action.action == nil {
                    break
                }
            }
            
        } else {
            
            /// Fill in all positions
            for position in tableSize6Players ? Self.positions6 : Self.positions9 {
                if !previousActions.contains(where: { $0.position == position }) {
                    previousActions.append(Action(
                        position: position,
                        action: .fold,
                        actionOptions: [.fold, .raise]
                    ))
                }
            }
            
            /// If user's first position is a fold, trim off the rest
            if let index = previousActions.firstIndex(where: { $0.position == yourPosition}) {
                if previousActions[index].action == .fold {
                    previousActions = Array(previousActions.prefix(index + 1))
                }
            }
            
            /// Reset actions
            for i in 0 ..< previousActions.count {
                if let action = previousActions[i].action, !previousActions[i].actionOptions.contains(action) {
                    previousActions[i].action = nil //previousActions[i].actionOptions.first
                }
            }
                
            /// Remove positions if user has not selected their action
            if let index = previousActions.firstIndex(where: { $0.action == nil && $0.position == yourPosition }) {
                previousActions = Array(previousActions.prefix(index + 1))
            }
            
            /// Remove 2nd actions
            previousActions.removeAll(where: { position in
                position.action == nil && previousActions.firstIndex(where: { $0.position == position.position }) != previousActions.firstIndex(of: position)
            })
            
            /// Add positions that are allowed to raise, 3-bet, 4-bet, or all-in
            let indexOfRaise = previousActions.firstIndex(where: { $0.action == .raise })
            let indexOf3Bet = previousActions.firstIndex(where: { $0.action == .threeBet })
            let indexOf4Bet = previousActions.firstIndex(where: { $0.action == .fourBet })
            let indexOfAllIn = previousActions.firstIndex(where: { $0.action == .allIn })
            let raisePosition = indexOfRaise == nil ? nil : previousActions[indexOfRaise!]
            let threeBetPosition = indexOf3Bet == nil ? nil : previousActions[indexOf3Bet!]
            let fourBetPosition = indexOf4Bet == nil ? nil : previousActions[indexOf4Bet!]
            let allInPosition = indexOfAllIn == nil ? nil : previousActions[indexOfAllIn!]
            
            /// Add any positions that can make a decision
            if previousActions.last?.action != nil {
                /// Determine the option
                var raiseOption: ActionType = .raise
                if fourBetPosition != nil {
                    raiseOption = .allIn
                }
                else if threeBetPosition != nil {
                    raiseOption = .fourBet
                }
                else if raisePosition != nil {
                    raiseOption = .threeBet
                }
                
                if let raisePosition, let threeBetPosition, previousActions.count(where: {$0.position == raisePosition.position}) < 2 {
                    previousActions.append(Action(
                        position: raisePosition.position,
                        action: nil,
                        actionOptions: [.fold, raiseOption]
                    ))
                }
                
                if let threeBetPosition, let fourBetPosition, previousActions.count(where: {$0.position == threeBetPosition.position}) < 2 {
                    previousActions.append(Action(
                        position: threeBetPosition.position,
                        action: nil,
                        actionOptions: [.fold, raiseOption]
                    ))
                }
                
                if let fourBetPosition, let allInPosition, previousActions.count(where: {$0.position == fourBetPosition.position}) < 2 {
                    previousActions.append(Action(
                        position: fourBetPosition.position,
                        action: nil,
                        actionOptions: [.fold, raiseOption]
                    ))
                }
            }
            
            /// If user's last position options are fold or all in, trim the remaining rows
            if let index = previousActions.lastIndex(where: { $0.position == yourPosition}) {
                if previousActions[index].actionOptions == [.fold, .allIn] {
                    previousActions = Array(previousActions.prefix(index + 1))
                }
            }
            
            /// Set the action options
            var previousAction: Action?
            for i in 0..<previousActions.count {
                
                /// Default options
                var options: [ActionType] = [.fold, .raise]
                
                /// Options based on previous action
                if let previousAction {
                    //print("Previous action: \(previousAction.action?.rawValue ?? "none")")
                    switch previousAction.action {
                    case .fold:
                        options = previousAction.actionOptions
                    case .raise:
                        options = previousAction.actionOptions
                        options.append(.call)
                        options.removeAll(where: { $0 == .raise })
                        options.append(.threeBet)
                    case .call:
                        options = previousAction.actionOptions
                    case .threeBet:
                        options = previousAction.actionOptions
                        options.removeAll(where: { $0 == .threeBet })
                        options.append(.fourBet)
                    case .fourBet:
                        options = previousAction.actionOptions
                        options.removeAll(where: { $0 == .call })
                        options.removeAll(where: { $0 == .fourBet })
                        options.append(.allIn)
                    case .allIn:
                        options = [.fold, .allIn]
                    case .none:
                        options = previousAction.actionOptions
                    }
                }
                
                /// Set the options
                previousActions[i].actionOptions = options
                previousActions[i].actionOptions = previousActions[i].actionOptions.removingDuplicates()
                
                /// Iterate to next action
                previousAction = previousActions[i]
            }
            
            /// Refresh the previous action text
            previousActionText = nil
            for position in previousActions {
                print(position.position, position.action?.rawValue ?? "none")
                if let action = position.action {
                    let actionText: String? = switch action {
                    case .fold:
                        nil
                    case .raise:
                        "raises"
                    case .call:
                        "calls"
                    case .threeBet:
                        "3-bets"
                    case .fourBet:
                        "4-bets"
                    case .allIn:
                        "All-in"
                    }
                    guard let actionText else { continue }
                    if previousActionText == nil {
                        previousActionText = ""
                    }
                    previousActionText?.append("\(position.position) \(actionText), ")
                }
            }
            if previousActionText?.hasSuffix(", ") ?? false {
                previousActionText = String(previousActionText!.dropLast(2))
            }
            print(previousActionText)
        }
    }
    
    func getAdvice() {
        
        /// Alert if no position selected
        if yourPosition == nil {
            errorMessage = "Please select your position before asking for advice."
            return
        }
        
        /// Alert if our last position already has a selected action
        if let yourPosition, let action = previousActions.last(where: { $0.position == yourPosition }), action.action != nil {
            
            /// Check that no one raised after us
            if !previousActions.contains(where: { position in
                guard let positionAction = position.action else { return false }
                if positionAction.isRaise && positionAction.isHigherRaise(than: action.action!) { return true }
                return false
            }) {
                errorMessage = "There is no advice if you were the last position to act."
                return
            }
            
        }
        
        /// Alert if yourPosition was the last position
        if let yourPosition, let action = previousActions.last(where: { $0.action != nil }), action.position == yourPosition {
            errorMessage = "There is no advice if you were the last position to act."
            return
        }
        
        /// Alert if user didn't fill in actions
        if yourPosition == "BB" && previousActions.firstIndex(where: { $0.action == .raise }) == nil {
            errorMessage = "\(yourPosition ?? "") can't be raise first in (RFI)."
            return
        }
        
        let card1 = "\(card1Rank)\(card1Suit.rawValue)"
        let card2 = "\(card2Rank)\(card2Suit.rawValue)"
        let position = yourPosition ?? ""
        let tableSize = tableSize6Players ? "SIX_MAX" : "NINE_MAX"
        let previousAction = previousActionText ?? ""
        
        let hand = Hand(card1: Card(rank: card1Rank.first!, suit: card1Suit.rawValue.first!), card2: Card(rank: card2Rank.first!, suit: card2Suit.rawValue.first!))
        let (advice, explanation, handStrength) = getAdviceString(hand: hand, position: yourPosition ?? "", actionSummary: previousAction, table6Players: tableSize6Players)
        self.advice = advice
        self.explanation = explanation
        self.handStrength = handStrength
        adviceIsPresented = true
        
        let handRecord = HandRecord(card1: card1, card2: card2, tableSize: tableSize, position: position, previousAction: previousAction, advice: advice)
        FirebaseManager.shared.saveHandRecord(handRecord, callback: { success in
            if !success {
                print("Error saving hand record.")
            }
        })
        
        print(advice)
        print(explanation)
        print(handStrength)
    }
    
    func getAdviceString(hand: Hand, position: String, actionSummary: String?, table6Players: Bool) -> (String, String, Double) {
        let handKey = hand.toKey()
        let actions = parseActionSummary(actionSummary ?? "", table6Players: table6Players)
        print(actions)
        let lastRaise = actions.last(where: { action in ["raises", "3-bets", "4-bets", "All-in"].contains(action.1) }) //actions.last { ["raises", "3-bets", "4-bets", "All-in"].contains($0.1) }
        print("lastRaise:", lastRaise)
        
        let strengthAction: String = {
            switch lastRaise?.1 {
            case "3-bets": return "3bet"
            case "4-bets": return "4bet"
            default: return "Open"
            }
        }()
        
        let handStrength = calculateHandStrength(hand: hand, position: position, action: strengthAction)
        
        let rfiRanges = (table6Players) ? SIX_MAX_RFI_RANGES : NINE_MAX_RFI_RANGES
        let facingRaisingRanges = (table6Players) ? SixMaxRFIThreeBetRanges.ranges : NineMaxRFIThreeBetRanges.ranges
        let facingThreeBetRanges = (table6Players) ? SixMaxFacingThreeBetRanges.ranges : NineMaxFacingThreeBetRanges.ranges
        let facingFourBetRanges = (table6Players) ? SixMaxFacingFourBetRanges.ranges : NineMaxFacingFourBetRanges.ranges
        
        let advice: String
        let explanation: String
        
        switch (lastRaise?.1) {
            // RFI situation
            case nil:
                if let range = rfiRanges[position], range.contains(hand) {
                    advice = "Raise"
                    explanation = "Your hand (\(handKey)) is strong enough to raise from \(position). It's a good spot to be more aggressive."
                } else {
                    advice = "Fold"
                    explanation = "Your hand (\(handKey)) isn't ideal for raising from \(position). It's better to fold and wait for a stronger spot."
                }
                
            // Facing a raise
            case "raises":
                if let raiserPosition = lastRaise?.0, let ranges = facingRaisingRanges[position]?[raiserPosition] {
                    if ranges.valueRange.contains(hand) {
                        advice = "3-Bet for Value"
                        explanation = "This hand (\(handKey)) is solid enough to 3-bet for value against a raise from \(raiserPosition) when you're in \(position), " +
                        "aiming to build the pot with a hand that plays well postflop."
                    } else if ranges.bluffRange.contains(hand) {
                        advice = "3-Bet Bluff or Fold"
                        explanation = "This hand (\(handKey)) is in the 3-bet bluffing range against a raise from \(raiserPosition) when you're in \(position). " +
                        "3-bet bluffs put pressure on your opponent's weaker holdings, forcing tough decisions while simultaneously balancing your 3-betting range and maintaining strategic unpredictability." +
                        " However, if you feel your opponent is a balanced or strong player, folding is better here."
                    } else if ranges.callRange.contains(hand) {
                        advice = "Call"
                        explanation = "This hand (\(handKey)) is in the calling range against a raise from \(raiserPosition) when you're in \(position)."
                    } else if ranges.rcRange.contains(hand) {
                        advice = "Raise or Call"
                        explanation = "This hand (\(handKey)) can be played as a mix of Raise/Call against a raise from \(raiserPosition) when you're in \(position)." +
                        " Against weaker opponents, taking the more aggressive action by raising puts them under pressure and maximizes your potential to dominate the hand. However, against stronger opponents, opting to call is often safer to avoid difficult post-flop confrontations."
                    } else if ranges.fcRange.contains(hand) {
                        advice = "Call or Fold"
                        explanation = "This hand (\(handKey)) is in the Call/Fold mix range against a raise from \(raiserPosition) when you're in \(position). Calling allows you to see the flop with a potentially high-equity hand, giving you the opportunity to leverage your post-flop skills." +
                        " However, folding is also acceptable, especially against strong opponents."
                    } else {
                        advice = "Fold"
                        explanation = "This hand (\(handKey)) is not strong enough to call or 3-bet against a raise from \(raiserPosition) when you're in \(position). " +
                        "Folding is the safest option here."
                    }
                } else {
                    advice = "Fold"
                    explanation = "There's no defined strategy for this position (\(position)) against a raise from \(lastRaise?.0 ?? ""). It's safest to fold."
                }
                
            // Facing a 3bet
            case "3-bets":
                if let threeBetPosition = lastRaise?.0, let ranges = facingThreeBetRanges[position]?[threeBetPosition] {
                    if ranges.fourBetValueRange.contains(hand) {
                        advice = "4-Bet for Value"
                        explanation = "This hand (\(handKey)) is strong enough to 4-bet for value against a 3-bet from \(threeBetPosition) when you're in \(position). " +
                        "A value 4-bet aims to maximize the potential of your strong hand by building a larger pot, especially when you expect weaker hands to continue or call."
                    } else if ranges.fourBetBluffRange.contains(hand) {
                        advice = "4-Bet Bluff or Fold"
                        explanation = "This hand (\(handKey)) can be used as a 4-bet bluff against a 3-bet from \(threeBetPosition) when you're in \(position). " +
                        "4-bet bluffing adds pressure on your opponent, often forcing folds from marginal hands. Using these bluffs also helps balance your overall range, " +
                        "making it harder for opponents to read your hand strength in similar situations." +
                        " However, if you feel your opponent is a balanced or strong player, folding is better here."
                    } else if ranges.callRange.contains(hand) {
                        advice = "Call"
                        explanation = "This hand (\(handKey)) is solid enough to call against a 3-bet from \(threeBetPosition) when you're in \(position). " +
                        "It has the potential to play well post-flop, allowing you to see how the board develops without committing more chips preflop."
                    } else if ranges.rcRange.contains(hand) {
                        advice = "Raise or Call"
                        explanation = "This hand (\(handKey)) is solid enough to play as a Raise/call mix against a 3-bet from \(threeBetPosition) when you're in \(position). " +
                        " Against weaker opponents, taking the more aggressive action by raising puts them under pressure and maximizes your potential to dominate the hand. However, against stronger opponents, opting to call is often safer to avoid difficult post-flop confrontations."
                    } else {
                        advice = "Fold"
                        explanation = "This hand (\(handKey)) isn't strong enough to continue against a 3-bet from \(threeBetPosition) when you're in \(position). " +
                        "Folding now helps avoid risky situations with weaker hands."
                    }
                } else {
                    advice = "Fold"
                    explanation = "There's no defined strategy for this position (\(position)) against a 3-bet from \(lastRaise?.0 ?? ""). It's safest to fold."
                }
                
            // Facing a 4bet
            case "4-bets":
                let fourBetPosition = lastRaise?.0
                let threeBetAction = actions.first { $0.1 == "3-bets" }
                let is3Bettor = threeBetAction?.0 == position
                
                if is3Bettor, let facingFourBetRange = facingFourBetRanges[position]?[fourBetPosition ?? ""] {
                    if facingFourBetRange.allInRange.contains(hand) {
                        advice = "All-In"
                        explanation = "As the 3-bettor, your hand (\(handKey)) is strong enough to move all-in against a 4-bet from \(fourBetPosition ?? ""). " +
                        " This hand has sufficient equity and value to warrant a 5-bet shove, applying maximum pressure and denying equity from your opponent to potentially win a large pot."
                    } else if facingFourBetRange.callRange.contains(hand) {
                        advice = "Call"
                        explanation = "As the 3-bettor, this hand (\(handKey)) is strong enough to call a 4-bet from \(fourBetPosition ?? ""). " +
                        "While not strong enough to move all-in, it has good playability and equity to continue."
                    } else if facingFourBetRange.bluffRange.contains(hand) {
                        advice = "All-In Bluff or Fold"
                        explanation = "As the 3-bettor, this hand (\(handKey)) can be used as an all-in bluff against a 4-bet from \(fourBetPosition ?? ""). " +
                        "While risky, occasionally moving all-in with these hands helps balance your range and prevents opponents from exploiting you." +
                        " Folding is suggested if you believe your opponent is extremely tight."
                    } else {
                        advice = "Fold"
                        explanation = "Even though you were the 3-bettor, this hand (\(handKey)) isn't strong enough to continue against a 4-bet from \(fourBetPosition ?? ""). " +
                        "The pot odds and implied odds don't justify continuing with this hand."
                    }
                } else {
                    switch handKey {
                    case "AA", "KK", "AKs":
                        advice = "All-In"
                        explanation = "Facing a cold 4-bet from \(fourBetPosition ?? ""), only the absolute strongest hands can move all-in. " +
                        "Your hand (\(handKey)) is at the top of your range and performs well enough against both the original 3-bettor and the 4-bettor."
                    case "QQ":
                        advice = "Call"
                        explanation = "Facing a cold 4-bet from \(fourBetPosition ?? ""), this hand (\(handKey)) is strong enough to call. " +
                        "While not strong enough to move all-in in a multi-way pot, it has enough equity to continue."
                    default:
                        advice = "Fold"
                        explanation = "Facing a cold 4-bet from \(fourBetPosition ?? ""), this hand (\(handKey)) isn't strong enough to continue. " +
                        "With multiple players showing strength, you should fold all but your strongest hands."
                    }
                }
                
            // Facing an all-in
            case "All-in":
                let allInPosition = lastRaise!.0
                if ["AA", "KK", "AKs", "QQ"].contains(handKey) {
                    advice = "Call"
                    explanation = "With \(handKey), you can call the all-in from \(allInPosition). " +
                    "These premium hands have enough equity to profitably call an all-in."
                } else {
                    advice = "Fold"
                    explanation = "\(handKey) is not strong enough to call an all-in from \(allInPosition). " +
                    "Only the absolute premium hands should continue here."
                }
                
            // Unexpected scenario
            default:
                advice = "Fold"
                explanation = "Unexpected scenario. It's recommended to fold unless you're very confident. Consider the actions: \(actions.map { "\($0.0) \($0.1)" }.joined(separator: ", "))."
            }
            
        
        return (advice, explanation, handStrength)
    }
    
    private func parseActionSummary(_ actionSummary: String, table6Players: Bool) -> [(String, String)] {
        guard !actionSummary.isEmpty else {
            return []
        }
        
        var parsedActions: [(String, String)] = []
        let actions = actionSummary.split(separator: ", ").map { String($0) }
        
        for action in actions {
            let parts = action.split(separator: " ").map { String($0) }
            if parts.count >= 2 {
                let position = parts[0]  // Already standardized (UTG, MP, etc.)
                let actionType: String
                
                switch parts[1] {
                case "raises": actionType = "raises"
                case "3-bets": actionType = "3-bets"
                case "4-bets": actionType = "4-bets"
                case "calls": actionType = "calls"
                case "All-in": actionType = "All-in"
                default: continue
                }
                
                parsedActions.append((position, actionType))
            }
        }
        
        // Validate against table size
        let validPositions: [String] = {
            return table6Players ? Self.positions6 : Self.positions9
        }()
        
        return parsedActions.filter { validPositions.contains($0.0) }
    }
    
    func calculateHandStrength(hand: Hand, position: String, action: String = "Open") -> Double {
        let rankOrder: [Character] = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
        
        func calculateBaseStrength(hand: Hand) -> Double {
            if hand.isPair {
                return 6.0 + Double(14 - rankOrder.firstIndex(of: hand.card1.rank)!) * 0.3
            } else {
                let highCardRank = min(rankOrder.firstIndex(of: hand.card1.rank)!, rankOrder.firstIndex(of: hand.card2.rank)!)
                let lowCardRank = max(rankOrder.firstIndex(of: hand.card1.rank)!, rankOrder.firstIndex(of: hand.card2.rank)!)
                return 3.5 + Double(14 - highCardRank) * 0.2 + Double(14 - lowCardRank) * 0.1
            }
        }
        
        func getPositionMultiplier(position: String, action: String) -> Double {
            let baseMultiplier: Double = ["BTN": 1.1, "CO": 1.05, "MP": 1.0, "UTG": 0.95, "SB": 0.85, "BB": 0.9][position] ?? 1.0
            
            return ["3bet": baseMultiplier * 0.9, "4bet": baseMultiplier * 0.7, "All-in": baseMultiplier * 0.6][action] ?? baseMultiplier
        }
        
        func getPremiumHandBonus(hand: Hand, action: String) -> Double {
            let isAA = hand.isPair && hand.card1.rank == "A"
            let isKK = hand.isPair && hand.card1.rank == "K"
            let isQQ = hand.isPair && hand.card1.rank == "Q"
            let isAK = !hand.isPair && Set([hand.card1.rank, hand.card2.rank]) == Set(["A", "K"])
            
            switch (action, isAA, isKK, isQQ, isAK) {
            case ("4bet", true, _, _, _), ("4bet", _, true, _, _): return 2.0
            case ("4bet", _, _, true, _), ("4bet", _, _, _, true): return 1.5
            case ("3bet", true, _, _, _), ("3bet", _, true, _, _), ("3bet", _, _, true, _): return 1.5
            case ("3bet", _, _, _, true): return 1.0
            default: return 0.0
            }
        }
        
        func getConnectorBonus(hand: Hand) -> Double {
            guard !hand.isPair else { return 0.0 }
            let gap = abs(rankOrder.firstIndex(of: hand.card1.rank)! - rankOrder.firstIndex(of: hand.card2.rank)!)
            return [1: 0.3, 2: 0.2, 3: 0.1][gap] ?? 0.0
        }
        
        func getBroadwayBonus(hand: Hand) -> Double {
            let isBroadway1 = ["A", "K", "Q", "J", "T"].contains(hand.card1.rank)
            let isBroadway2 = ["A", "K", "Q", "J", "T"].contains(hand.card2.rank)
            return isBroadway1 && isBroadway2 ? 0.4 : (isBroadway1 || isBroadway2 ? 0.1 : 0.0)
        }
        
        func getSuitednessBonus(hand: Hand) -> Double {
            return hand.isSuited ? (hand.card1.rank == "A" || hand.card2.rank == "A" ? 1.4 : 0.5) : 0.0
        }
        
        func getLowCardPenalty(hand: Hand) -> Double {
            let rank1 = rankOrder.firstIndex(of: hand.card1.rank)!
            let rank2 = rankOrder.firstIndex(of: hand.card2.rank)!
            let hasAce = hand.card1.rank == "A" || hand.card2.rank == "A"
            
            let basePenalty: Double = [8...13: 2.0, 6...7: 1.5, 4...5: 1.0].first(where: { $0.key.contains(rank1) && $0.key.contains(rank2) })?.value ?? 0.0
            return hasAce ? basePenalty / 2 : basePenalty
        }
        
        func getDisconnectedPenalty(hand: Hand) -> Double {
            guard !hand.isPair else { return 0.0 }
            let gap = abs(rankOrder.firstIndex(of: hand.card1.rank)! - rankOrder.firstIndex(of: hand.card2.rank)!)
            return gap >= 4 ? 1.5 + Double(gap - 4) * 0.3 : 0.0
        }
        
        let baseStrength = calculateBaseStrength(hand: hand)
        let positionMultiplier = getPositionMultiplier(position: position, action: action)
        let suitednessBonus = getSuitednessBonus(hand: hand)
        let connectorBonus = getConnectorBonus(hand: hand)
        let broadwayBonus = getBroadwayBonus(hand: hand)
        let premiumHandBonus = getPremiumHandBonus(hand: hand, action: action)
        
        let finalLowCardPenalty: Double = ["3bet": 1.5, "4bet": 2.0][action].map { getLowCardPenalty(hand: hand) * $0 } ?? getLowCardPenalty(hand: hand)
        let finalDisconnectedPenalty: Double = ["3bet": 1.3, "4bet": 1.6][action].map { getDisconnectedPenalty(hand: hand) * $0 } ?? getDisconnectedPenalty(hand: hand)
        
        let rawStrength = min(10.0, max(0.0, (baseStrength * positionMultiplier + suitednessBonus + connectorBonus + broadwayBonus + premiumHandBonus - finalLowCardPenalty - finalDisconnectedPenalty)))
        
        return (rawStrength * 10).rounded() / 10.0
    }

}

struct HomeView: View {
    
    @StateObject var vm: HomeViewModel
    
    @State var logoutIsPresented: Bool = false
    @State var tablePositionsIsPresented: Bool = false
    @State var howToUseIsPresented: Bool = false
    @State var errorMessageIsPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            navigationBar
            VStack {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal, 20)
        }
        .background(Colors.tintColorLight)
        .onChange(of: vm.errorMessage) { message in
            if !message.isEmpty {
                errorMessageIsPresented.toggle()
            }
        }
        .alert(vm.errorMessage, isPresented: $errorMessageIsPresented, actions: {
            Button {
                vm.errorMessage = ""
                print("Do nothing")
            } label: {
                Text("Okay")
            }
        })
    }
    
    var navigationBar: some View {
        ZStack {
            Image("text_only")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 20)
            HStack {
                Button {
                    logoutIsPresented = true
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                
                Spacer()
                
                Menu(content: {
                    Button {
                        vm.tableSize6Players = true
                    } label: {
                        Label("6 Players", systemImage: vm.tableSize6Players ? "checkmark.square.fill" : "square")
                    }
                    Button {
                        vm.tableSize6Players = false
                    } label: {
                        Label("9 Players", systemImage: !vm.tableSize6Players ? "checkmark.square.fill" : "square")
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                })
            }
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .foregroundStyle(.white)
        .background(Colors.tintColorPrimary)
        .preferredColorScheme(.light)
        .alert("Log Out", isPresented: $logoutIsPresented, actions: {
            Button {
                vm.logout()
            } label: {
                Text("Yes")
            }
            Button {
                print("No action")
            } label: {
                Text("No")
            }
        }, message: {
            Text("Are you sure you want to log out?")
        })
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 15) {
                handSelection
                yourPosition
                if vm.yourPosition != nil {
                    previousActions
                }
                getAdviceButton
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            card1SelectionView
                .offset(y: vm.card1SelectionIsPresented ? 0 : 800)
        
            card2SelectionView
                .offset(y: vm.card2SelectionIsPresented ? 0 : 800)
            
            TablePositionsView(isPresented: $tablePositionsIsPresented)
                .offset(y: tablePositionsIsPresented ? 0 : 800)
            
            AdviceView(isPresented: $vm.adviceIsPresented, advice: vm.advice, explanation: vm.explanation, handStrength: vm.handStrength)
                .offset(y: vm.adviceIsPresented ? 0 : 800)
            
            HowToUseView(isPresented: $howToUseIsPresented)
                .offset(y: howToUseIsPresented ? 0 : 800)
        }
    }
    
    var handSelection: some View {
        VStack {
            Text("Select Your Hand")
                .font(.roboto(size: 20, weight: .regular))
            HStack(spacing: 20) {
                CardThumbnailView(suit: $vm.card1Suit, rank: $vm.card1Rank)
                    .onTapGesture {
                        vm.card2SelectionIsPresented = false
                        vm.card1SelectionIsPresented = true
                    }
                CardThumbnailView(suit: $vm.card2Suit, rank: $vm.card2Rank)
                    .onTapGesture {
                        vm.card1SelectionIsPresented = false
                        vm.card2SelectionIsPresented = true
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(15)
        .foregroundStyle(.white)
        .background(Colors.tintColorPrimary)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
    }
    
    var yourPosition: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .trailing) {
                Text("Your Position")
                    .font(.roboto(size: 16, weight: .regular))
                    .foregroundStyle(Colors.tintColorDark)
                    .frame(maxWidth: .infinity)
                
                Button {
                    tablePositionsIsPresented = true
                } label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                        .foregroundStyle(Colors.tintColorDark)
                }
            }
            
            /// Custom drop-down
//            PositionSelectionView(selectedPosition: $vm.yourPosition, positions: vm.tableSize6Players ? HomeViewModel.positions6 : HomeViewModel.positions9)
//                .onChange(of: vm.yourPosition ?? "") { _, newPosition in
//                    vm.setPosition(newPosition)
//                }
            
            /// Native drop-down
            Menu {
                ForEach(vm.tableSize6Players ? HomeViewModel.positions6 : HomeViewModel.positions9, id: \.self) { position in
                    Button {
                        vm.setPosition(position)
                    } label: {
                        Text("\(position)")
                    }
                }
            } label: {
                Text(vm.yourPosition ?? "Select Position")
                    .font(.roboto(size: 15, weight: .regular))
                    .foregroundStyle(Colors.tintColorDark)
                    .opacity(vm.yourPosition == nil ? 0.5 : 1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(10)
                    .background(.white)
                    .cornerRadius(5)
                    .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Colors.tintColorPrimary, lineWidth: 1)
                    }
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity)
    }
    
    var previousActions: some View {
        VStack(spacing: 10) {
            /// Header
            ZStack(alignment: .trailing) {
                Text("Previous Action")
                    .font(.roboto(size: 16, weight: .regular))
                    .foregroundStyle(Colors.tintColorDark)
                    .frame(maxWidth: .infinity)
                
                HStack {
                    Button {
                        vm.resetPreviousActions()
                        if let position = vm.yourPosition {
                            vm.setPosition(position)
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundStyle(Colors.tintColorDark)
                    }
                    
                    Spacer()
                    
                    Button {
                        howToUseIsPresented = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundStyle(Colors.tintColorDark)
                    }
                }
            }
            
            /// Text
            if let previousActionText = vm.previousActionText {
                Text(previousActionText)
                    .font(.roboto(size: 14, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Colors.tintColorDark)
            }
            
            /// Table
            if !vm.previousActions.isEmpty {
                PreviousActionsTable(vm: vm)
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
    }
    
    var getAdviceButton: some View {
        Button {
            vm.getAdvice()
        } label: {
            Text("GET ADVICE")
                .font(.roboto(size: 16, weight: .regular))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(Colors.tintColorPrimary)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.15), radius: 2, y: 2)
        }
    }
    
    var card1SelectionView: some View {
        CardSelectionView(isPresented: $vm.card1SelectionIsPresented, suit: $vm.card1Suit, rank: $vm.card1Rank)
            .onChange(of: vm.card1Suit) { old, new in
                if vm.card1Suit == vm.card2Suit && vm.card1Rank == vm.card2Rank {
                    vm.errorMessage = "Cannot use the same card twice."
                    vm.card1Suit = old
                }
            }
            .onChange(of: vm.card1Rank) { old, new in
                if vm.card1Suit == vm.card2Suit && vm.card1Rank == vm.card2Rank {
                    vm.errorMessage = "Cannot use the same card twice."
                    vm.card1Rank = old
                }
            }
    }
    
    var card2SelectionView: some View {
        CardSelectionView(isPresented: $vm.card2SelectionIsPresented, suit: $vm.card2Suit, rank: $vm.card2Rank)
            .onChange(of: vm.card2Suit) { old, new in
                if vm.card1Suit == vm.card2Suit && vm.card1Rank == vm.card2Rank {
                    vm.errorMessage = "Cannot use the same card twice."
                    vm.card2Suit = old
                }
            }
            .onChange(of: vm.card2Rank) { old, new in
                if vm.card1Suit == vm.card2Suit && vm.card1Rank == vm.card2Rank {
                    vm.errorMessage = "Cannot use the same card twice."
                    vm.card2Rank = old
                }
            }
    }
}

struct PreviousActionsTable: View {
    @StateObject var vm: HomeViewModel
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach($vm.previousActions) { $action in
                    PreviousActionsRow(vm: vm, action: $action)
                        .background(action.position == vm.yourPosition ? Colors.tintColorLight : .clear)
                }
            }
        }
    }
}

struct PreviousActionsRow: View {
    @StateObject var vm: HomeViewModel
    @Binding var action: Action
    var body: some View {
        HStack {
            Text(action.position)
                .font(.roboto(size: 16, weight: .regular))
                .frame(width: 60, height: 30, alignment: .leading)
            buttons
            Spacer()
        }
        .onChange(of: action) {
            print("previousActions changed.")
            vm.refreshActions()
        }
    }
    
    var buttons: some View {
        HStack {
            ForEach(action.actionOptions, id: \.self) { option in
                button(option)
            }
        }
    }
    
    @ViewBuilder
    func button(_ buttonAction: ActionType) -> some View {
        Button {
            action.action = buttonAction
        } label: {
            Text(buttonAction.rawValue)
                .font(.roboto(size: 14, weight: .bold))
                .frame(width: 60, height: 30)
                .foregroundStyle(buttonAction == action.action ? .white : Colors.tintColorDark)
                .background(buttonAction == action.action ? Colors.tintColorPrimary : .white)
                .cornerRadius(5)
                .overlay {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Colors.tintColorPrimary)
                        .padding(1)
                }
        }
    }
}

struct CardThumbnailView: View {
    @Binding var suit: Suit
    @Binding var rank: String
    var body: some View {
        HStack(spacing: 0) {
            Text(rank)
                .font(.roboto(size: 38, weight: .regular))
                .foregroundStyle(.black)
            Text(suit.rawValue)
                .font(.roboto(size: 38, weight: .regular))
                .foregroundStyle(suit.isRed ? .red : .black)
//            Image(suit.rawValue)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 30, height: 30)
        }
        .frame(width: 150, height: 140)
        .background(.white)
        .cornerRadius(10)
    }
}

struct CardSelectionView: View {
    @Binding var isPresented: Bool
    @Binding var suit: Suit
    @Binding var rank: String
    var body: some View {
        VStack(spacing: 10) {
            Text("Select a card")
                .font(.roboto(size: 24, weight: .bold))
                .foregroundStyle(.white)
                .padding(.bottom, 10)
            
            Text("Rank")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(Colors.tintColorLight)
                .frame(maxWidth: .infinity, alignment: .leading)
            rankGrid
                .padding(.bottom, 10)
            
            Text("Suit")
                .font(.system(size: 17, weight: .medium))
                .foregroundStyle(Colors.tintColorLight)
                .frame(maxWidth: .infinity, alignment: .leading)
            suitSelection
                .padding(.bottom, 10)
            
            Button {
                isPresented = false
            } label: {
                Text("SELECT")
                    .font(.roboto(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .foregroundStyle(Colors.tintColorDark)
                    .background(Colors.tintColorLight)
                    .cornerRadius(8)
            }
            .shadow(color: .black.opacity(0.25), radius: 2, y: 2)
        }
        .padding(15)
        .background(Colors.tintColorDark)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
        .animation(.smooth(duration: 0.3), value: isPresented)
    }
    
    var rankGrid: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                RankSelectionButton(rank: "A", selectedRank: $rank)
                RankSelectionButton(rank: "K", selectedRank: $rank)
                RankSelectionButton(rank: "Q", selectedRank: $rank)
                RankSelectionButton(rank: "J", selectedRank: $rank)
            }
            HStack(spacing: 8) {
                RankSelectionButton(rank: "T", selectedRank: $rank)
                RankSelectionButton(rank: "9", selectedRank: $rank)
                RankSelectionButton(rank: "8", selectedRank: $rank)
                RankSelectionButton(rank: "7", selectedRank: $rank)
            }
            HStack(spacing: 8) {
                RankSelectionButton(rank: "6", selectedRank: $rank)
                RankSelectionButton(rank: "5", selectedRank: $rank)
                RankSelectionButton(rank: "4", selectedRank: $rank)
                RankSelectionButton(rank: "3", selectedRank: $rank)
            }
            HStack(spacing: 8) {
                RankSelectionButton(rank: "2", selectedRank: $rank)
            }
        }
    }
    
    var suitSelection: some View {
        HStack(spacing: 8) {
            SuitSelectionButton(suit: .spades, selectedSuit: $suit)
            SuitSelectionButton(suit: .hearts, selectedSuit: $suit)
            SuitSelectionButton(suit: .diamonds, selectedSuit: $suit)
            SuitSelectionButton(suit: .clubs, selectedSuit: $suit)
        }
    }
}

struct RankSelectionButton: View {
    let rank: String
    @Binding var selectedRank: String
    var body: some View {
        Text(rank)
            .font(.roboto(size: 16, weight: .bold))
            .frame(width: 75, height: 45)
            .background(selectedRank == rank ? Colors.tintColorPrimary : .white)
            .foregroundStyle(selectedRank == rank ? .white : .black)
            .cornerRadius(10)
            .onTapGesture {
                selectedRank = rank
            }
    }
}

struct SuitSelectionButton: View {
    let suit: Suit
    @Binding var selectedSuit: Suit
    var body: some View {
        Text(suit.rawValue)
            .font(.roboto(size: 16, weight: .bold))
            .frame(width: 75, height: 45)
            .background(selectedSuit == suit ? Colors.tintColorPrimary : .white)
            .foregroundStyle(suit.isRed ? .red : .black)
            .cornerRadius(10)
            .onTapGesture {
                selectedSuit = suit
            }
    }
}

struct TablePositionsView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    isPresented = false
                }
            VStack {
                Text("Table Positions")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(Colors.tintColorDark)
                Image("poker_table")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(15)
            .background(Colors.tintColorLight)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
            .animation(.smooth(duration: 0.3), value: isPresented)
        }
    }
}

struct HowToUseView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    isPresented = false
                }
            VStack(spacing: 10) {
                Text("How to use Action Table")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(Colors.tintColorDark)
                
                Text("The action table allows you to input what happened before your move.\n\n    • All positions start on fold by default.\n\n    • Your position is always highlighted\n\n    • Made a mistake? Use the reset button located in the top left to start over.\n\nThe table automatically updates based on actions selected, and a summary appears at the top.")
                    .font(.roboto(size: 14, weight: .regular))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Colors.tintColorDark)
            }
            .padding(15)
            .background(.white)
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
            .animation(.smooth(duration: 0.3), value: isPresented)
        }
    }
}

struct AdviceView: View {
    @Binding var isPresented: Bool
    let advice: String
    let explanation: String
    let handStrength: Double
    
    var foreground: Color {
        if advice.contains("Call") { /// Anything with "call"
            return .blue
        }
        else if advice.contains("Raise") || advice.contains("Bet") || advice.contains("All") {
            return .green
        }
        else if advice.contains("Fold") {
            return .red
        }
        else {
            return .gray
        }
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    isPresented = false
                }
            VStack {
                Text(advice)
                    .font(.roboto(size: 30, weight: .bold))
                    .foregroundStyle(foreground)
                Text(explanation)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(10)
                Text("Hand Strength")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(.white)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundStyle(.gray)
                        .frame(width: 280, height: 15)
                    Rectangle()
                        .foregroundStyle(LinearGradient(colors: [.red, .orange, .yellow, .green], startPoint: .leading, endPoint: .trailing))
                        .frame(width: 280*(handStrength/10), height: 15)
                }
                .cornerRadius(7.5)
                Text("\(String(format: "(%.1f%)", handStrength)) / 10.0")
                    .font(.roboto(size: 16, weight: .bold))
                    .foregroundStyle(.white)
            }
            .padding(15)
            .background(Color(white: 0.1))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
            .animation(.smooth(duration: 0.3), value: isPresented)
        }
    }
}

#Preview {
    HomeView(
        vm: HomeViewModel(
            logout: {
                print("logout")
            }
        )
    )
}
