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
    func scoreRecord(
        matchFormat: MatchFormat,
        pointInputBtn: PointInputBtn,
        service: Service,
        position: Position,
        matchId:String,
        setId: String,
        gameId: String,
        server: Server,
        getPoint: GetPoint
    ){
        let realm = try! Realm()
        try! realm.write {
            pointData.id = UUID().uuidString
            pointData.machId = matchId
            pointData.setId = setId
            pointData.gameId = gameId
            pointData.matchFormat = matchFormat.rawValue
            pointData.gemeType = gametype.rawValue
            pointData.player1id = UUID().uuidString
            pointData.player1position = position.rawValue
            pointData.server = server.rawValue
            pointData.service = service.rawValue
            pointData.getPoint = getPoint.rawValue
            pointData.pointDateTime = Date()
            realm.add(pointData)
        }
    }
    
    func naviTitle(matchFormat: MatchFormat) -> String{
        var naviTitle: String
        switch matchFormat {
        case .singles:
            naviTitle = "シングルスポイントゲーム"
        case .doubles:
            naviTitle = "ダブルスポイントゲーム"
        case .noSelection:
            naviTitle = ""
        }
        return naviTitle
    }
    
    func deleteAll(){
        let realm = try! Realm()
        let result = realm.objects(PointData.self)
        try! realm.write {
            realm.delete(result)
        }
    }
    
    func printAll(){
        let realm = try! Realm()
        let result = realm.objects(PointData.self)
        print(result)
    }
}

