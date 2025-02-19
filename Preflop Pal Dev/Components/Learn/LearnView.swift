//
//  LearnView.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/11/25.
//

import SwiftUI

enum LearnViewSelection {
    case intro, faq, terminology
}

struct LearnView: View {
    
    @State var selection: LearnViewSelection = .intro
    
    var title: String {
        switch selection {
        case .intro:
            "Learn Poker Basics!"
        case .faq:
            "FAQ"
        case .terminology:
            "Common Poker Terms"
        }
    }
    
    var body: some View {
        VStack {
            navigationBar
            VStack {
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .padding(.horizontal, 20)
        }
        .background(Colors.tintColorLight)
    }
    
    var navigationBar: some View {
        ZStack() {
            Text(title)
                .font(.roboto(size: 24, weight: .bold))
                .frame(maxWidth: .infinity)
            HStack {
                Button {
                    selection = .intro
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                .opacity(selection == .intro ? 0 : 1)
                
                Spacer()
                
                Menu(content: {
                    Button {
                        selection = .faq
                    } label: {
                        Text("FAQs")
                    }
                    Button {
                        selection = .terminology
                    } label: {
                        Text("Poker Terminology")
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
        .frame(height: 48)
        .foregroundStyle(.white)
        .background(Colors.tintColorPrimary)
        .preferredColorScheme(.light)
    }
    
    var content: some View {
        Group {
            switch selection {
            case .intro:
                explainer
            case .faq:
                faq
            case .terminology:
                terminology
            }
        }
    }
    
    let explainerFontSize: CGFloat = 15
    var explainer: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Welcome to the ")
                    .font(.roboto(size: explainerFontSize, weight: .regular)) +
                Text("Preflop Practice Mode")
                    .font(.roboto(size: explainerFontSize, weight: .bold))
                
                Text("This comprehensive tool will help you master poker strategy from the very first action. This interactive section is designed to help simulate real-world preflop scenarios and sharpen your decision-making skills. Whether you're a beginner looking to learn the fundamentals or an experienced player refining your edge, this tool offers a dynamic way to practice and improve.")
                    .font(.roboto(size: explainerFontSize, weight: .regular))
                
                Text("In addition to the practice mode, we've included an ")
                    .font(.roboto(size: explainerFontSize, weight: .regular)) +
                Text("FAQ page")
                    .font(.roboto(size: explainerFontSize, weight: .bold)) +
                Text(" to answer common questions and ")
                    .font(.roboto(size: explainerFontSize, weight: .regular)) +
                Text("Terminology page")
                    .font(.roboto(size: explainerFontSize, weight: .bold)) +
                Text(" to familiarize you with essential poker terms. These resources ensure you have the support and knowledge needed to confidently navigate and enhance your poker game.")
                    .font(.roboto(size: explainerFontSize, weight: .regular))
                
                Text("Dive in, explore, and start your journey to becoming a more skilled and strategic poker player!")
                    .font(.roboto(size: explainerFontSize, weight: .regular))
                
                Text("Note: Practice mode is currently under development and will be available soon. Stay tuned!")
                    .font(.roboto(size: explainerFontSize, weight: .bold))
                    .italic()
            }
            .padding(10)
            .background(.white)
            .foregroundStyle(Colors.tintColorDark)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
            Spacer()
        }
    }
    
    let faqFontSize: CGFloat = 13
    var faq: some View {
        ScrollView {
            VStack {
                DropdownView(
                    title: "What are the Hand Rankings?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Royal Flush: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("A, K, Q, J, 10, all of the same suit.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Straight Flush: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Five consecutive cards of the same suit.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Four of a Kind: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Four cards of the same rank.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Full House: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Three of a kind combined with a pair.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Flush: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Any five cards of the same suit, not in sequence.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Straight: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Five consecutive cards of different suits.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Three of a Kind: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Three cards of the same rank.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Two Pair: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Two different pairs.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("One Pair: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Two cards of the same rank.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("High Card: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("When you don't have any of the above, your highest card plays.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "Why is Positioning Important in Poker?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("In poker, your position at the table relative to the dealer is crucial. The later your position, the more information you have about how other players are acting, allowing you to make better-informed decisions.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Early Position:")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("The first few players to act are in an early position and are at a disadvantage because they must make decisions with little information.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Middle Position:")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Players in the middle have more information but still need to be cautious.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Late Position:")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("The last few players to act are in a late position and have the advantage of seeing how others have bet, allowing them to make more strategic decisions.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "What is Preflop in Poker?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Preflop ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("is the phase in poker before any community cards (the flop) are dealt. During this stage, players assess their hole cards (the two private cards dealt to each player) and decide whether to call, raise, or fold. These initial decisions are based on the strength of their hand and their position at the table. ")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("This phase is crucial as it sets the foundation for the rest of the hand and significantly impacts the potential outcome of the game.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "What is Postflop in Poker?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Postflop ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("refers to all phases in poker after the initial community cards, or the flop, have been dealt. This includes the Flop, Turn, and River betting rounds, where players use these community cards along with their hole cards to build the best hand possible.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Decisions made during postflop play are crucial and rely on analyzing hand strength, board texture, and opponents' potential ranges. This stage of the game demands strong skills in betting strategy and reading opponents.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "What is Bluffing in Poker?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("In poker, ")
                                .font(.roboto(size: faqFontSize, weight: .regular)) +
                            Text("bluffing ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("is a strategy where a player bets or acts confidently with a weak or low-value hand to mislead opponents into thinking they hold a stronger hand. The goal is to induce opponents to fold better hands, allowing the bluffer to win the pot without needing the best cards.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Semi-Bluff: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("A safer form of bluffing where you have a decent chance of improving to a strong hand if your bluff gets called.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Pure Bluff: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("When you have a weak hand with little chance of improving, and you’re relying solely on your opponent folding.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "What are typical betting sizes in poker?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Preflop: ")
                                .font(.roboto(size: faqFontSize, weight: .bold))
                            
                            Text("• Open Raise: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("2x-3x the big blind is common in most games.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("• 3-Bet (re-raise): ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Typically 3-4x the initial raise size, or about 2.5x if you're in position (acting after the other player).")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Postflop: ")
                                .font(.roboto(size: faqFontSize, weight: .bold))
                            
                            Text("• C-Bet (Continuation Bet): ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("50%-75% of the pot size is common after the flop, depending on the board texture.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("• Value Bet: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("60%-100% of the pot to maximize winnings when you have a strong hand.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("• Bluff Bet: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("50%-70% of the pot is often used to try to push opponents off weaker hands.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("These guidelines vary based on experience, table dynamics, and player style but are consistent and strategically sound bets.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
                
                DropdownView(
                    title: "What is Bankroll Management?",
                    descriptionContent: {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Bankroll management is essential for sustaining long-term success in poker. Your bankroll is the money set aside solely for poker, and managing it carefully helps you handle the natural swings of the game.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Set Limits: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Decide beforehand how much you're willing to lose in a session and stick firmly to that limit.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Play Within Your Means: ")
                                .font(.roboto(size: faqFontSize, weight: .bold)) +
                            Text("Avoid risking your entire bankroll in one game or hand. A common rule of thumb is to only risk 1-2% of your bankroll per session.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                            
                            Text("Following these guidelines helps protect your bankroll and keeps you in the game longer, even during unlucky stretches.")
                                .font(.roboto(size: faqFontSize, weight: .regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                )
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
    }
    
    var terminology: some View {
        ScrollView {
            VStack {
                DropdownView<AnyView>(title: "Ante", description: "A small bet all players are required to make before a hand is dealt. An ante is similar to a blind, but everyone has to contribute it before a hand commences. Antes give the pot a value right off the bat.", descriptionContent: nil)
                DropdownView<AnyView>(title: "All-In", description: "A bet that places all of a player's chips into the pot.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Backdoor", description: "Hitting your needed cards on the turn and the river to make your hand. For example, if there's one heart on the board and you have two in your hand and two more hearts show up on the turn and river, you've hit a \"backdoor\" flush.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Bad Beat", description: "When a player who initially had a substantial statistical lead over an opponent loses his hand to that opponent after the flop, turn, or river.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Bad Beat Story", description: "A retelling or recollection of a bad beat. These are often boring tales you already know the end of. For example: \"I had ace-king, and my opponent had 2-3. There was an ace on the board. The turn was a 4, and then - Can you believe it? - the river was a 5!\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Big Blind", description: "The amount of chips the second player to the left of the dealer has to bet. The amount depends on the stakes. Like an ante, it is a posted amount that makes the pot worth playing for before the action begins. It is equivalent to one complete first round bet. It's called a blind because it amounts to placing a bet without seeing the cards first.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Blind", description: "The generic term for either the big blind or the small blind. If you are one of the blinds, you are sitting either immediately to the left of the dealer button (small blind position) or one position farther left (big blind).", descriptionContent: nil)
                DropdownView<AnyView>(title: "Board", description: "The community cards that everyone uses in combination with their pocket cards to form the best hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Burn", description: "The discarding of the top card before each betting round. In the case that there is a distinguishing mark on the top card, the burn card keeps the next card to be dealt concealed before it comes out. That way no unfair information is being intentionally or unintentionally conveyed.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Button", description: "The position of the dealer. In live poker, it's usually denoted by placing a plastic disk in front of the dealer. It rotates clockwise each time the dealer shuffles for a new hand. The button is in an advantageous position, for they act last in a betting round.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Call", description: "To contribute the minimum amount of money to the pot necessary to continue playing a hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Check", description: "To pass on betting. If there's no action (bet) to you, there's nothing to call. If you don't want to bet, you can just \"check.\" If there's subsequent action from your fellow players in the betting round, then the action will come back to you to either call, fold, or raise.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Check-Raise", description: "A check-raise is made when a player checks on the first opportunity to bet and later raises any subsequent bet in the same betting round.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Cold Call", description: "To call two or more bets on your turn. If a pot has been bet and raised before it gets to you, and then you call, you're cold calling.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Connector", description: "Sequential pocket cards. A 5 of clubs and 6 of hearts would be connectors. If the connectors are the same suit, they are \"suited connectors\" - e.g., 5 and 6 of clubs.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Community Cards", description: "Cards that are dealt face up in the center of the table, available for all players to use in making a hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Counterfeit", description: "A duplicate card on the board that greatly devalues your hand. If you have a pair of 6's in your hand, and the board is ace-ace-7-4, and the river card is a 7, you've been \"counterfeited.\" You had two pairs, but now the board has two better pairs. Any other player with a card higher than a 6 in their hand now beats your hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Cut-Off", description: "The position to the immediate right of the button.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Dealer", description: "The player who shuffles the deck and deals the cards.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Dealer Button", description: "The button (often a plastic disk in live poker) that indicates the dealer. It is passed clockwise after every hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Draw", description: "Remaining in a hand in the hopes of improving it. For example, you don't have anything concrete yet, but need one or more cards for a straight or a flush. If you call (or raise) a round of betting to see if the needed card(s) come, you are said to be \"drawing.\" The two most common draws are flush draws (drawing for a flush) and straight draws (drawing for a straight). You can also draw for a three of a kind, full house, or better.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Drawing Dead", description: "You're drawing, but it's futile because there is not one card in the deck that will create a winning hand for you. If you have two pairs and hope to make a full house on the river, but your opponent already has four of a kind, you are \"drawing dead.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Flop", description: "The first three community cards dealt out after the first round of betting is complete.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Flush", description: "A poker hand consisting of five cards of the same suit.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Fold", description: "To give up by placing your cards face down on the table, losing whatever you have bet so far. You only fold when you think your hand is too weak to compete against the other players.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Four of a Kind", description: "A hand containing all four cards of the same rank.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Full House", description: "A hand consisting of a three of a kind and a (different) pair.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Gutshot", description: "A straight completed from \"inside\" by one possible card. For example, if your pocket cards are 5 and 6 and the flop shows 4-8-king, a 7 and only a 7 on the turn or river would complete your \"gutshot\" straight. It is the opposite of an open-ended straight, which is completed by any one of two cards from the outside. A gutshot is half as likely to hit as an open-ended straight.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Hand", description: "Five cards, made of a player's pocket cards and the community cards.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Heads-Up", description: "Playing a pot or tournament against only one other player.", descriptionContent: nil)
                DropdownView<AnyView>(title: "High Card", description: "In a hand of poker that has 5 different cards that do not form any kind of match, the highest card is the high card and it is only useful against another hand of 5 unmatched cards if a showdown takes place.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Implied Odds", description: "Taking future calls from your fellow players into consideration when you are drawing to something. If you draw successfully, you expect they'll call with their hands. These funds are speculative and not concrete, as they aren't in the middle yet and won't be unless you hit your card and they call your bets - hence, \"implied.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Kicker", description: "If you have the same hand as another player at showdown, the one with the highest kicker wins the pot. For example, if the board is 7-7-5-5-2, and you have ace-king and your opponent has king-queen, you win because your ace beats his king. Your ace is the \"kicker.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Late Position", description: "Position on a round of betting where the player must act after most of the other players have acted (usually considered to be the two positions next to the button).", descriptionContent: nil)
                DropdownView<AnyView>(title: "Limp", description: "Slang word for calling, implying it's not an aggressive move.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Muck", description: "All the discarded cards in a hand. If a player folds, he tosses his hand \"into the muck.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Nuts", description: "The best possible hand one can have at a given moment. For example, if you have pocket 7's, and the flop is 7-6-2, you have the \"nuts\" at this point, as trip 7's would be the best possible hand. If the turn card is a 5, you would no longer have the nuts, as that honor now goes to anyone holding 8-9, making a straight. If the river is the last 7, you'd again have the nuts, as your hand is once again the best possible hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Off-suit", description: "Holding pocket cards of different suits.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Over-Pair", description: "In hold'em, a pair in the hole that is larger than any community card on the board.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Open-Ended", description: "A straight completed from the outside by one of two possible cards. For example, if your pocket cards are 5-6 and the flop shows 4-7-king, either a 3 or an 8 on the turn or river would complete your open-ended straight. An open-ended straight is twice as likely to hit as a \"gutshot.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Orbit", description: "After each player at a table has served as the dealer for a hand. Each time the button passes you is a complete orbit.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Out", description: "A card that will improve your hand. If all the money is in the middle, and you turn over a pair of kings and your opponent has a pair of aces, you need one of the two remaining kings - your two \"outs\" - to beat your opponent.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Over-cards", description: "Having cards higher than the board cards or your opponent's pocket. For example, if it's heads up and someone's all-in, the two remaining players would expose their cards. If it is a pair of sevens versus ace-king, the ace and king are referred to as \"over-cards.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Pair", description: "Two cards of the same rank.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Pocket Cards", description: "The cards in your hand that are not part of the community cards. In hold'em, it's your two down cards. In Omaha, it's your four down cards. Also known as hole cards.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Pot", description: "The place in the center of the poker table where wagered chips are placed. The winner of the hand wins all the chips in the pot.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Pot-Committed", description: "A situation that likely requires you to call due to the amount of money in the pot vis-a-vis your remaining stack of chips. In these situations, it makes no sense to fold.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Pot Odds", description: "The ratio of money in the pot compared to what you need to call to keep playing. For example, suppose there is $100 in the pot. Somebody bets $10, so the pot now contains $110. It costs you $10 to call, so your pot odds are 11-to-1. If your odds of winning are better than 11-to-1, you should call.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Quads", description: "Four of a kind.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Rainbow", description: "In flop games, a flop in which no two cards are of the same suit. E.g., \"The flop was an ace-9-7 rainbow.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Rake", description: "The amount that the house takes out of a poker hand.", descriptionContent: nil)
                DropdownView<AnyView>(title: "River", description: "The final of the five community cards.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Rock", description: "Slang for a \"tight\" player. A rock can sit at a table orbit after orbit without playing for a pot. When he enters a pot, you know he's got the goods.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Raise", description: "To wager more than the minimum required to call, forcing other players to put in more money as well.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Royal Flush", description: "An ace-high straight flush, the best possible hand in standard poker.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Semi-Bluff", description: "A bluff with a hand that has the potential to improve should the bluff itself be ineffective.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Set", description: "Having a pocket pair that hits on the board, making three of a kind.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Short Stack", description: "Having fewer chips than the rest of the players at the table or in the tournament.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Showdown", description: "When, after the final round of betting, players turn their hands face-up. A poker hand will only reach a showdown if there are callers in the last round of betting, or if someone is all-in prior to the last betting round.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Side Pot", description: "Separate from the main pot. If one or more players is all-in, the pot to which the all-in players contributed is the main pot. A side pot is created from any additional money bet by the remaining players. There can be many side pots if there is more than one all-in player. An all-in player is only eligible to win a pot to which they have contributed.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Slow Play", description: "When, in an attempt to have other players stick around and possibly call your bets, you play your hand less aggressively than necessary. For example, if you flop a full house, it is unlikely anyone is going to beat your hand. Slow-playing the hand may allow the other players to make their hands and therefore continue to call your bets.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Small Blind", description: "The smaller of two blind bets. The position to the immediate left of the dealer button position, and to the right of the big blind position.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Split Pot", description: "When two or more players make the same hand and the pot is divided between equivalent high hands.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Straddle", description: "An optional pre-deal bet, typically made by the player to the left of the big blind. The straddle amount is twice the big blind (same as a legal raise). The straddler earns the \"option\" from the big blind. They may re-raise when the action comes around. A straddle is a cash game convention and is not usually permitted in a tournament.", descriptionContent: nil)
                DropdownView<AnyView>(title: "String Bet", description: "Placing a bet on the table in a staggered motion or multiple motions. String bets are not allowed, and the dealer will remove the added amount of the bet if it is determined to be a string bet. It's not permitted because it could be used to gauge the reaction of other players before you commit the entire intended amount of the raise.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Straight", description: "A hand consisting of 5 cards in sequence but not in suit.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Straight Flush", description: "A hand consisting of 5 cards in sequence and the same suit.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Tilt", description: "Usually the result of taking a bad beat or series of bad beats, a player is said to be \"on tilt\" when they play with reckless abandon. The term likely derives from tilting a pinball machine.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Top Pair", description: "A pair with the highest card on the board. For example, if you have an ace and 7 in the hole, and the flop shows 3-4-7, you've got a \"top pair\" with an ace kicker.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Trips", description: "Slang for three of a kind.", descriptionContent: nil)
                DropdownView<AnyView>(title: "Turn", description: "The fourth community card. Put out face-up, by itself. Also known as \"Fourth Street.\"", descriptionContent: nil)
                DropdownView<AnyView>(title: "Under the Gun", description: "Player sitting in the first-to-act position. It's the position immediately to the left of the big blind pre-flop, and to the left of the button for subsequent betting rounds.", descriptionContent: nil)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .shadow(color: .black.opacity(0.25), radius: 5, y: 5)
    }
}

struct DropdownView<Content: View>: View {
    let title: String
    let description: String?
    let descriptionContent: Content?
    
    init(title: String, description: String? = nil, descriptionContent: (() -> Content)? = nil) {
        self.title = title
        self.description = description
        self.descriptionContent = descriptionContent?()
    }
    
    @State var isDropped: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack(alignment: .trailing) {
                Text(title)
                    .font(.roboto(size: 16, weight: .bold))
                    .frame(maxWidth: .infinity)
                Image(systemName: "chevron.down")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 12, height: 12)
                    .fontWeight(.semibold)
                    .rotationEffect(.degrees(isDropped ? 180 : 0))
            }
            
            if isDropped {
                if let description {
                    Text(description)
                        .font(.roboto(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                if let descriptionContent {
                    descriptionContent
                }
            }
        }
        .padding(15)
        .frame(maxWidth: .infinity)
        .background(.white)
        .foregroundStyle(Colors.tintColorDark)
        .cornerRadius(10)
        .onTapGesture {
            isDropped.toggle()
        }
        .animation(.smooth(duration: 0.15), value: isDropped)
    }
}

#Preview {
    LearnView()
}
