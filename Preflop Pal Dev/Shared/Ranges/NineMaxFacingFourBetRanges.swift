//
//  NineMaxFacingFourBetRanges.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/12/25.
//

struct NineMaxFacingFourBetRanges {
    static let ranges: [String: [String: FacingFourBetRange]] = [
        "UTG": [
            // Can't face UTG+1 4-bet
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: ["AKs"])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: ["AKs"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: ["AKs"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["A5s"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "UTG+1": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AKs", "QQ"]),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "UTG+2": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "AKs"]),
                allInRange: Range(hands: ["AA", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "LJ": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["ATs"])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "HJ": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ", "65s"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "QQ", "JJ", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "CO": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "QQ", "65s"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "QQ", "JJ", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "A5s", "KQs", "KJs", "QQ", "JJ", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "BTN": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "QQ", "JJ", "65s"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "QQ", "JJ", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A5s"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "A5s", "KQs", "KJs", "JJ", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo", "QQ"]),
                bluffRange: Range(hands: ["A5s"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "KJs", "KTs", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "SB": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "QQ", "JJ", "65s"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A5s"])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "QQ", "JJ", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo", "A4s"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "KJs", "JJ", "TT", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo", "QQ"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AJs", "KQs"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["AQs", "AQo", "A5s", "KJs"])
            ),
            "BB": FacingFourBetRange(
                callRange: Range(hands: ["QQ", "JJ", "TT"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            )
        ],
        "BB": [
            "UTG": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A4s", "A2s"])
            ),
            "UTG+1": FacingFourBetRange(
                callRange: Range(hands: []),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A3s"])
            ),
            "UTG+2": FacingFourBetRange(
                callRange: Range(hands: ["QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A3s"])
            ),
            "LJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "QQ", "JJ", "99"]),
                allInRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: ["AKo", "A4s"])
            ),
            "HJ": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                allInRange: Range(hands: ["AA", "AKs", "KK", "AKo"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "CO": FacingFourBetRange(
                callRange: Range(hands: ["AQs"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BTN": FacingFourBetRange(
                callRange: Range(hands: ["AJs", "KQs"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["AQs", "A5s"])
            ),
            "SB": FacingFourBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs"]),
                allInRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["AQo", "A5s", "A4s", "QJs"])
            )
        ]
    ]
}
