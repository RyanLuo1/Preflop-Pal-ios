//
//  SixMaxFacingThreeBetRanges.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/12/25.
//

class SixMaxFacingThreeBetRanges {
    static let ranges: [String: [String: FacingThreeBetRange]] = [
        "UTG": [
            "MP": FacingThreeBetRange(
                callRange: Range(hands: ["KJs", "99", "88"]),
                rcRange: Range(hands: ["AQs", "JJ", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AJs", "A5s", "KQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: ["ATs", "KJs", "KTs", "JTs", "99", "88", "77", "66"]),
                rcRange: Range(hands: ["AQs", "JJ", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AJs", "A5s", "KQs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "99", "88"]),
                rcRange: Range(hands: ["ATs", "KJs", "JJ", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQo"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "KQs", "KJs", "QQ", "JJ", "TT", "99", "88"]),
                rcRange: Range(hands: ["AKo"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "KK"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "KQs", "KJs", "QQ", "JJ", "TT", "99"]),
                rcRange: Range(hands: ["AKo"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "KK"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "MP": [
            "CO": FacingThreeBetRange(
                callRange: Range(hands: ["AJs", "A5s", "KTs", "JTs", "99", "88", "77", "66"]),
                rcRange: Range(hands: ["AQs", "AQo", "KQs", "KJs", "TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "KQs", "99", "88", "77"]),
                rcRange: Range(hands: ["TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["ATs", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["KQs"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "KQs", "KJs", "KTs", "QQ", "QJs", "JJ", "TT", "99"]),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "CO": [
            "MP": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A9s", "A8s", "A5s", "A4s", "KQs", "K9s", "QJs", "QTs", "JTs", "T9s", "99", "98s", "88", "87s", "77", "76s", "66", "65s", "55", "44", "33", "22"]),
                rcRange: Range(hands: ["TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["AQo", "KJs", "KTs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "ATs", "A9s", "A5s", "KQs", "KJs", "KTs", "QJs", "QTs", "JJ", "JTs", "TT", "T9s", "99", "88", "77"]),
                rcRange: Range(hands: ["AKo"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "A5s", "A4s", "KQs", "KJs", "KTs", "QJs", "JTs", "TT", "99", "88"]),
                rcRange: Range(hands: ["AQo", "JJ"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "BTN": [
            "MP": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["AJs", "A5s", "KQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: ["AJs", "A5s", "KQs"])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQs", "QQ", "JJ", "TT", "99"]),
                fourBetBluffRange: Range(hands: ["AQo", "AJs", "ATs", "KJs"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "AJo", "ATs", "A9s", "A8s", "A7s", "A5s", "A4s", "A3s", "KQs", "KQo", "KJs", "KTs", "K9s", "K6s", "QJs", "QTs", "JTs", "J9s", "T9s", "T8s", "99", "88", "77", "76s", "66"]),
                rcRange: Range(hands: ["TT"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ", "JJ"]),
                fourBetBluffRange: Range(hands: [])
            )
        ],
        "SB": [
            "MP": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "BB": FacingThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A9s", "A8s", "A7s", "A6s", "A5s", "A3s", "A2s", "KJs", "KTs", "K9s", "K8s", "QJs", "QTs", "Q9s", "JTs", "J9s", "T9s", "T8s", "99", "98s", "88", "77", "66", "55"]),
                rcRange: Range(hands: ["AQo", "KQs"]),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ", "TT"]),
                fourBetBluffRange: Range(hands: ["AJo", "ATo", "A4s", "KQo"])
            )
        ],
        "BB": [
            "MP": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            ),
            "CO": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["A5s", "KQs"])
            ),
            "BTN": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: [])
            ),
            "SB": FacingThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fourBetValueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                fourBetBluffRange: Range(hands: ["AQs"])
            )
        ]
    ]
}
