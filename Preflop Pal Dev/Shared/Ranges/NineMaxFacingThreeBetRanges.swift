//
//  NineMaxFacingThreeBetRanges.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/12/25.
//

struct NineMaxFacingThreeBetRanges {
    static let ranges: [String: [String: FacingThreeBetRange]] = [
        "UTG": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: ["QQ", "AQs"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: ["AQs", "QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: ["AQs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AJs", "ATs", "KJs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "UTG+1": [
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s", "KQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: ["AQs", "QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s", "KQs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                rcRange: Range(hands: ["AJs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["ATs", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["QQ"]),
                rcRange: Range(hands: ["AQs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "UTG+2": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s", "KQs"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: ["AQs", "QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s", "KQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: ["AQs", "QQ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AJs", "A5s", "A4s", "KQs", "KTs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ", "JJ"]),
                rcRange: Range(hands: ["AJs", "ATs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["KQs", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                rcRange: Range(hands: ["AKo", "AJs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs"]),
                fourBetBluffRange: Range(hands: ["AJs", "KJs"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "QQ"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AJs", "ATs"])
            )
        ],
        "LJ": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["JJ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJs", "A5s", "KQs", "KJs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "TT"]),
                rcRange: Range(hands: ["JJ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJs", "ATs", "A5s", "KQs", "KJs", "KTs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["JJ", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJs", "ATs", "KQs", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "KQs"]),
                rcRange: Range(hands: ["AJs", "ATs", "QQ", "JJ", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "QQ", "JJ"]),
                rcRange: Range(hands: ["AKo"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "HJ": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["AJs", "ATs", "KQs", "KTs"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                fourBetBluffRange: Range(hands: ["AQo", "KJs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["AJs", "ATs", "KQs"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ", "TT"]),
                fourBetBluffRange: Range(hands: ["AQo", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "KQs", "QQ", "JJ", "TT", "99"]),
                rcRange: Range(hands: ["KJs"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQo", "A5s"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "QQ", "JJ", "TT", "99", "88", "77"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["KTs"])
            )
        ],
        "CO": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: ["AQs"]),
                rcRange: Range(hands: ["JJ"]),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s", "A4s"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs"]),
                rcRange: Range(hands: ["ATs", "A5s", "TT", "99"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJo", "KJs", "KTs", "K9s", "JTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs"]),
                rcRange: Range(hands: ["ATs", "KJs", "KTs", "99"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["AJo"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "TT", "99", "88"]),
                rcRange: Range(hands: ["JJ"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQo", "A8s", "KJo"])
            )
        ],
        "BTN": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["AJs"])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["AQs", "76s"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ", "TT"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJs", "ATs", "KQs", "KJs", "KTs", "99"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A5s", "KQs", "KJs", "KTs", "QJs", "QTs", "JTs", "99", "88", "77", "66"]),
                rcRange: Range(hands: ["AQs", "AQo", "AJo", "A8s", "A7s", "KQo", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["ATo"])
            )
        ],
        "SB": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["ATs"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A9s", "KQs", "KJs", "KTs", "QJs", "JTs", "99", "88", "77", "66"]),
                rcRange: Range(hands: ["A7s", "A6s", "A5s", "K9s", "Q9s", "J9s", "T9s"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ", "TT"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJo", "ATo", "A4s", "A3s", "KQo", "K5s"])
            )
        ],
        "BB": [
            "UTG+1": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "UTG+2": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "LJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "AKs", "AKo", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "HJ": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "KK", "QQ", "AKs", "AKo"]),
                fourBetBluffRange: Range(hands: ["A4s"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            )
        ]
    ]
}
