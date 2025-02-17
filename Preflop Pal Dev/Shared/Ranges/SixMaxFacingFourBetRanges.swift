//
//  SixMaxFacingFourBetRanges.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/12/25.
//

struct SixMaxFacingFourBetRanges {
    static let ranges: [String: [String: FacingFourBetRange]] = [
        "UTG": [
            // Can't face MP 4-bet
            "CO": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "MP": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "A5s", "QQ", "JJ", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "A5s", "QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "CO": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "MP": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "A5s", "KQs", "KJs", "QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "A5s", "KQs", "QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "BTN": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "MP": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "A4s", "KQs", "KJs", "KTs", "QQ", "JJ", "JTs", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "ATs", "A5s", "A4s", "KQs", "KJs", "KTs", "QJs", "JJ", "JTs", "TT", "99", "88"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "SB": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "MP": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                bluffRange: Range(hands: [])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "A4s", "KQs", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["ATs", "A5s"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "ATs", "KQs", "KJs", "KTs", "99", "88", "77"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "BB": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "MP": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "KJs", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                bluffRange: Range(hands: ["A5s"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "ATs", "KQs", "KJs", "KTs", "JTs", "T9s", "99", "88"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "ATs", "A5s", "KQs", "KJs", "KTs", "QJs", "QTs", "JTs", "TT", "T9s", "99", "98s", "88", "87s", "76s", "65s", "54s"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["A4s"])
            )
        ]
    ]
}
