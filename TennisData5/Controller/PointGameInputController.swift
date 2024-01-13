import Foundation
import RealmSwift
class PointGameInputController {
    var pointData = PointData()
    var pointDataList: [PointData] = []
    let userName:String = "わたなべ"
    let opponentName:String = "対戦相手"
    let opponentsName:String = "対戦チーム"
    let inputModeText:String = "アドバンスモード"
    let gametype: GameType = .pointGame
    let naviTitle: String = "シングルスポイントゲーム"
    
}

