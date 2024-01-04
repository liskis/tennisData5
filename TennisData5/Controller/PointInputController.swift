//
//  PointInputController.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/02.
//

import Foundation

class PointInputController {
    static let userName:String = "わたなべ"
    static let partnerName:String = "partner"
    static let opponentName:String = "対戦相手"
    static let opponentsName:String = "対戦チーム"
    static let winCount:Int = 3
    static let loseCount:Int = 2
    static let myPoint:Int = 2
    static let opponentPoint:Int = 1
    static let inputModeText:String = "アドバンスモード"
    static func naviTitle(gameType: String) -> String{
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
