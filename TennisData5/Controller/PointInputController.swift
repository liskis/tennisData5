//
//  PointInputController.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/02.
//

import Foundation

class PointInputController {
    let userName:String = "わたなべ"
    let opponentName:String = "対戦相手"
    let winCount:Int = 3
    let loseCount:Int = 2
    let myPoint:Int = 2
    let opponentPoint:Int = 1
    let inputModeText:String = "アドバンスモード"
    func naviTitle(gameType: String) -> String{
        switch gameType {
        case "singlesPointGame":
            return "シングルスポイントゲーム"
        case "doublesPointGame":
            return "ダブルスポイントゲーム"
        case "setMatch":
            return "セットマッチ"
        case "tieBreak":
            return "タイブレーク"
        default:
            return ""
        }
    }
}
