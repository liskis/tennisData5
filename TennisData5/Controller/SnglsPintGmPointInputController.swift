import Foundation
import RealmSwift
class SnglsPintGmPointInputController {
    var pointData = PointData()
    var pointDataList: [PointData] = []
    let userName:String = "わたなべ"
    let opponentName:String = "対戦相手"
    let opponentsName:String = "対戦チーム"
    let inputModeText:String = "アドバンスモード"
    let gametype: GameType = .pointGame
    let matchFormat: MatchFormat = .singles
    let naviTitle: String = "シングルスポイントゲーム"
    func scoreRecord(
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
    
    func deleteAll(){
        let realm = try! Realm()
        _ = realm.objects(PointData.self)
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func printAll(){
        let realm = try! Realm()
        let result = realm.objects(PointData.self)
        pointDataList = Array(result)
        print(pointDataList)
    }
}

