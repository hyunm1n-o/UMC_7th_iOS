//
//  DiceModel.swift
//  TableView
//
//  Created by 오현민 on 10/8/24.
//

import Foundation

struct DiceModel {
    let diceImage: String
    let diceName: String
}

// final : 더미데이터 클레스 수정 불가
// static : 싱클톤으로 더미 데이터 사용할 수 있게
final class dummyDiceModel {
    static let diceDatas: [DiceModel] = [
        DiceModel(diceImage: "dice 1.png", diceName: "주사위 1"),
        DiceModel(diceImage: "dice 2.png", diceName: "주사위 2"),
        DiceModel(diceImage: "dice 3.png", diceName: "주사위 3"),
        DiceModel(diceImage: "dice 4.png", diceName: "주사위 4"),
        DiceModel(diceImage: "dice 5.png", diceName: "주사위 5"),
        DiceModel(diceImage: "dice 6.png", diceName: "주사위 6")
    ]
}
