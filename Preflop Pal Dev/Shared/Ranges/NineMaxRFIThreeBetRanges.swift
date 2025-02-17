//
//  NineMaxRFIThreeBetRanges.swift
//  Preflop Pal Dev
//
//  Created by Ryan Luo on 2/12/25.
//

struct NineMaxRFIThreeBetRanges {
    static let ranges: [String: [String: RFIThreeBetRange]] = [
        // UTG can't face RFI
        "UTG+1": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["AJs", "ATs", "A8s", "A7s", "A5s", "A4s", "KJs", "KTs", "K5s"])
            )
        ],
        "UTG+2": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["ATs", "A8s", "A7s", "A5s", "A4s", "KJs", "KTs", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "KJs", "KTs"])
            )
        ],
        "LJ": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["ATs", "A8s", "A7s", "A5s", "A4s", "KJs", "KTs", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "KJs", "KTs", "K5s"])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["99"]),
                rcRange: Range(hands: ["TT"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "KQo", "KJs", "KTs", "K5s"])
            )
        ],
        "HJ": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["JJ", "TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "A8s", "A7s", "KJs", "KTs", "K6s", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "KJs", "KTs", "K5s"])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "KQo", "KJs", "KTs", "K5s"])
            ),
            "LJ": RFIThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AJs", "KK", "KQs", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["AQo", "ATs", "A5s", "A4s", "A3s", "KQo", "KJs", "KTs", "99"])
            )
        ],
        "CO": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: []),
                rcRange: Range(hands: ["JJ", "TT"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQs", "QQ"]),
                bluffRange: Range(hands: ["ATs", "A7s", "A5s", "A4s", "KJs", "KTs", "K6s", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQs", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AQo", "AJs", "ATs", "A5s", "A4s", "A3s", "KJs", "KTs", "K5s"])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["TT"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQs", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AQo", "AJs", "ATs", "A5s", "A4s", "KQo", "KJs", "KTs", "K5s", "65s"])
            ),
            "LJ": RFIThreeBetRange(
                callRange: Range(hands: ["99", "88", "77"]),
                rcRange: Range(hands: ["JJ", "TT"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "ATs", "A5s", "A4s", "A3s", "KK", "KQs", "KQo", "KJs", "KTs", "QQ"]),
                bluffRange: Range(hands: ["AJo", "A8s"])
            ),
            "HJ": RFIThreeBetRange(
                callRange: Range(hands: ["99", "88", "77", "66"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "KK", "KQs", "KQo", "KJs", "QQ", "QJs", "JJ", "TT"]),
                bluffRange: Range(hands: ["AJo", "ATs", "A9s", "A8s", "A7s", "A5s", "A4s", "A3s", "KTs", "QTs"])
            )
        ],
        "BTN": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "KQs", "JTs", "TT", "99", "88", "77", "54s"]),
                rcRange: Range(hands: ["AQo", "A8s", "A5s", "A4s", "A3s", "KJs", "KTs", "QQ", "JJ"]),
                fcRange: Range(hands: ["QJs", "QTs", "T9s", "66", "65s"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: ["K9s", "K6s", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "KQs", "99", "88", "77", "54s"]),
                rcRange: Range(hands: ["AQo", "A8s", "A5s", "A4s", "A3s", "KTs", "QQ", "JJ", "JTs", "TT"]),
                fcRange: Range(hands: ["98s", "66", "65s"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: ["A7s", "KQo", "K9s", "K6s", "K5s"])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A9s", "KQs", "QTs", "99", "88", "77", "66", "54s"]),
                rcRange: Range(hands: ["AQs", "AQo", "A5s", "A4s", "A3s", "QQ", "QJs", "JJ", "TT"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK", "QQ"]),
                bluffRange: Range(hands: ["K9s", "K6s", "K5s"])
            ),
            "LJ": RFIThreeBetRange(
                callRange: Range(hands: ["99", "88", "77"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "KK", "KQs", "KQo", "KJs", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["AJo", "ATs", "A5s", "A4s", "KTs"])
            ),
            "HJ": RFIThreeBetRange(
                callRange: Range(hands: ["99", "88", "77"]),
                rcRange: Range(hands: []),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "KK", "KQs", "KQo", "KJs", "QQ", "QJs", "JJ", "TT"]),
                bluffRange: Range(hands: ["AJo", "ATs", "A9s", "A8s", "A7s", "A5s", "A4s", "A3s", "KTs", "QTs"])
            ),
            "CO": RFIThreeBetRange(
                callRange: Range(hands: ["ATs", "77"]),
                rcRange: Range(hands: ["AJs", "KJs", "KTs", "QJs", "QTs", "JTs", "TT", "99", "88"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "KK", "KQo", "QQ", "JJ"]),
                bluffRange: Range(hands: ["AJo", "ATo", "A9s", "A8s", "A7s", "A6s", "A5s", "A4s", "A3s", "KJo", "K9s", "K6s", "Q9s"])
            )
        ],
        "SB": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "JTs", "TT", "99", "88"]),
                rcRange: Range(hands: ["A5s", "A3s", "KQs", "KJs", "KTs", "QQ", "JJ"]),
                fcRange: Range(hands: ["77", "66", "65s", "54s"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "A4s", "KK"]),
                bluffRange: Range(hands: ["AQo", "K6s", "K5s"])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "JTs", "99", "88", "77"]),
                rcRange: Range(hands: ["AQo", "A5s", "A4s", "KQs", "KJs", "KTs", "QQ", "JJ", "TT"]),
                fcRange: Range(hands: ["QJs", "QTs", "T9s", "66", "54s"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: ["K6s", "K5s"])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AJs", "ATs", "JJ", "JTs", "TT", "99", "88", "77", "66"]),
                rcRange: Range(hands: ["AQo", "A5s", "A3s", "KQs", "KJs", "KTs", "QQ", "QJs"]),
                fcRange: Range(hands: ["A9s", "QTs"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: ["A4s", "K6s"])
            ),
            "LJ": RFIThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A9s", "99", "88", "77", "66", "55"]),
                rcRange: Range(hands: ["AQo", "A5s", "QJs", "JJ", "JTs", "TT"]),
                fcRange: Range(hands: ["44", "33", "22"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ"]),
                bluffRange: Range(hands: ["A4s", "A3s", "KQo", "KTs"])
            ),
            "HJ": RFIThreeBetRange(
                callRange: Range(hands: ["AJs", "ATs", "A9s", "A8s", "KQs", "KJs", "KTs", "TT", "99", "88", "77", "66", "55"]),
                rcRange: Range(hands: ["AJo", "A5s", "QJs", "QTs"]),
                fcRange: Range(hands: ["44", "33"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "KQo", "QQ"]),
                bluffRange: Range(hands: ["A4s", "A3s", "K6s"])
            ),
            "CO": RFIThreeBetRange(
                callRange: Range(hands: ["88", "77"]),
                rcRange: Range(hands: ["AJs", "ATs", "KQs", "KJs", "99"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "KK", "KQo", "QQ", "QJs", "JJ", "TT"]),
                bluffRange: Range(hands: ["AJo", "A9s", "A5s", "A4s", "A3s", "KJo", "KTs", "K9s", "QTs", "JTs"])
            )
        ],
        "BB": [
            "UTG": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "AJo", "ATs", "ATo", "A9s", "A8s", "A7s", "A6s", "A5s", "A4s", "A3s", "A2s", "KQs", "KQo", "KJs", "KTs", "K9s", "K8s", "K7s", "QQ", "QJs", "QTs", "Q9s", "Q8s", "Q6s", "JJ", "JTs", "JTo", "J9s", "J8s", "J7s", "TT", "T9s", "T8s", "T7s", "T6s", "99", "98s", "97s", "96s", "88", "87s", "86s", "85s", "77", "76s", "75s", "74s", "66", "65s", "64s", "63s", "55", "54s", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["AKo", "K6s", "K5s", "K4s", "K3s", "K2s"]),
                fcRange: Range(hands: ["KJo", "J5s"]),
                valueRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+1": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "AJo", "ATs", "ATo", "A9s", "A8s", "A7s", "A6s", "A5s", "A4s", "A3s", "A2s", "KQs", "KQo", "KJs", "KTs", "K9s", "K8s", "K7s", "QQ", "QJs", "QTs", "Q9s", "Q8s", "Q6s", "JJ", "JTs", "JTo", "J9s", "J8s", "J7s", "TT", "T9s", "T8s", "T7s", "T6s", "99", "98s", "97s", "96s", "88", "87s", "86s", "85s", "77", "76s", "75s", "74s", "66", "65s", "64s", "63s", "55", "54s", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["AKo", "K6s", "K5s", "K4s", "K3s", "K2s"]),
                fcRange: Range(hands: ["KJo", "KTo", "QTo"]),
                valueRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "UTG+2": RFIThreeBetRange(
                callRange: Range(hands: ["AQs", "AQo", "AJs", "AJo", "ATs", "ATo", "A9s", "A8s", "A7s", "A6s", "A5s", "A4s", "A3s", "A2s", "KQs", "KQo", "KJs", "KJo", "KTs", "K9s", "K8s", "K7s", "K6s", "K3s", "K2s", "QQ", "QJs", "QTs", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "JJ", "JTs", "JTo", "J9s", "J8s", "J7s", "J6s", "TT", "T9s", "T8s", "T7s", "T6s", "99", "98s", "97s", "96s", "95s", "88", "87s", "86s", "85s", "77", "76s", "75s", "74s", "66", "65s", "64s", "63s", "55", "54s", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["AKo", "K5s", "K4s"]),
                fcRange: Range(hands: ["KTo", "QJo", "QTo", "T9o"]),
                valueRange: Range(hands: ["AA", "AKs", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "LJ": RFIThreeBetRange(
                callRange: Range(hands: ["AQo", "AJs", "AJo", "ATs", "ATo", "A9s", "A9o", "A8s", "A7s", "A6s", "A5s", "A4s", "A3s", "A2s", "KQs", "KQo", "KJs", "KJo", "KTs", "KTo", "K9s", "K8s", "K7s", "K6s", "K5s", "K4s", "K3s", "K2s", "QJo", "QTs", "QTo", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "Q3s", "Q2s", "JJ", "JTs", "JTo", "J9s", "J8s", "J7s", "J6s", "J5s", "TT", "T9s", "T9o", "T8s", "T7s", "T6s", "99", "98s", "97s", "96s", "95s", "88", "86s", "85s", "77", "75s", "74s", "66", "64s", "63s", "55", "54s", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["AQs", "QQ", "QJs", "87s", "76s", "65s"]),
                fcRange: Range(hands: ["T9o", "98o", "87o"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "KK"]),
                bluffRange: Range(hands: [])
            ),
            "HJ": RFIThreeBetRange(
                callRange: Range(hands: ["AJs", "AJo", "ATs", "ATo", "A9s", "A9o", "A8s", "A8o", "A7s", "A7o", "A6s", "A5s", "A4s", "A3s", "A2s", "KQs", "KQo", "KJs", "KJo", "KTs", "KTo", "K9s", "K9o", "K8s", "K7s", "K6s", "K5s", "K4s", "K3s", "K2s", "QJo", "QTo", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "Q3s", "Q2s", "JJ", "JTs", "JTo", "J9s", "J8s", "J7s", "J6s", "J5s", "J4s", "J3s", "TT", "T9s", "T9o", "T8s", "T7s", "T6s", "99", "98s", "98o", "97s", "96s", "95s", "88", "86s", "85s", "77", "75s", "74s", "66", "64s", "63s", "55", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["A4o", "QJs", "QTs", "87s", "76s", "65s"]),
                fcRange: Range(hands: ["K9o", "87o", "76o", "65o"]),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ"]),
                bluffRange: Range(hands: [])
            ),
            "CO": RFIThreeBetRange(
                callRange: Range(hands: ["AQo", "AJs", "AJo", "ATs", "ATo", "A9s", "A9o", "A8s", "A7s", "A6s", "A3s", "A2s", "KQs", "KJo", "KTs", "KTo", "K9s", "K8s", "K7s", "K6s", "K5s", "K4s", "QJs", "QJo", "QTs", "QTo", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "JTs", "JTo", "J9s", "J8s", "J7s", "J6s", "TT", "T9s", "T8s", "T7s", "99", "98s", "97s", "96s", "88", "87s", "86s", "85s", "77", "76s", "75s", "74s", "66", "65s", "64s", "63s", "55", "54s", "53s", "44", "43s", "33", "22"]),
                rcRange: Range(hands: ["A5s", "A5o", "A4s", "KQo", "KJs", "K3s", "K2s", "Q3s", "Q2s"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "KK", "QQ", "JJ"]),
                bluffRange: Range(hands: [])
            ),
            "BTN": RFIThreeBetRange(
                callRange: Range(hands: ["AJo", "ATs", "ATo", "A9s", "A9o", "A8s", "A8o", "A7s", "A6s", "A4s", "A3s", "A2s", "KQo", "KJs", "K9s", "K8s", "K7s", "K6s", "K5s", "K4s", "K3s", "K2s", "QJs", "QTs", "Q9s", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "JTo", "J9s", "J8s", "J7s", "J6s", "J5s", "J4s", "T9o", "T8s", "T7s", "T6s", "98s", "97s", "96s", "88", "87s", "86s", "85s", "77", "76s", "75s", "74s", "66", "65s", "64s", "55", "54s", "53s", "44", "43s", "33", "22"]),
                rcRange: Range(hands: ["A7o", "A5o", "KJo", "KTs", "KTo", "K9o", "QJo", "QTo", "Q3s", "Q2s", "JTs", "99"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "KK", "KQs", "QQ", "JJ", "TT"]),
                bluffRange: Range(hands: ["A5s", "T9s"])
            ),
            "SB": RFIThreeBetRange(
                callRange: Range(hands: ["AJo", "ATs", "ATo", "A9s", "A9o", "A8s", "A8o", "A7s", "A7o", "A6s", "A5o", "A3s", "A2s", "KQo", "KJo", "KTo", "K9o", "K8s", "K8o", "K7s", "K6s", "K5s", "K4s", "K3s", "K2s", "QJo", "QTs", "QTo", "Q9s", "Q9o", "Q8s", "Q7s", "Q6s", "Q5s", "Q4s", "Q3s", "Q2s", "JTo", "J9s", "J9o", "J8s", "J7s", "J6s", "J5s", "J4s", "J3s", "T9o", "T8s", "T7s", "T6s", "98o", "97s", "96s", "95s", "88", "86s", "85s", "77", "75s", "74s", "66", "64s", "63s", "55", "53s", "52s", "44", "43s", "42s", "33", "32s", "22"]),
                rcRange: Range(hands: ["A6o", "A3o", "KTs", "K9s", "JTs", "J2s", "T9s", "99", "87s", "76s", "54s"]),
                fcRange: Range(hands: []),
                valueRange: Range(hands: ["AA", "AKs", "AKo", "AQs", "AQo", "AJs", "A5s", "A4s", "KK", "KQs", "KJs", "QQ", "QJs", "JJ", "TT"]),
                bluffRange: Range(hands: ["A3o", "A2o", "Q8o", "J8o", "T3s", "T2s", "98s"])
            )
        ]
    ]
}
