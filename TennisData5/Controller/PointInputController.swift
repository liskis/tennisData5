import Foundation

class PointInputController {
    let userName:String = "わたなべ"
    let partnerName:String = "partner"
    let opponentName:String = "対戦相手"
    let opponentsName:String = "対戦チーム"
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
