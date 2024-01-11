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
    ) -> [String: Int] {
        let pointId = UUID().uuidString
        let realm = try! Realm()
        try! realm.write {
            pointData.id = pointId
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
        let gameResult = realm.objects(PointData.self).filter("matchId == \(matchId) AND setId == \(setId) AND gameId == \(gameId)")
        var myPoint: Int = 0
        var opponentPoint: Int = 0
        for point in gameResult {
            if point.getPoint == "myTeam" {
                myPoint += 1
            } else {
                opponentPoint += 1
            }
        }
        return ["myPoint":myPoint,"opponentPoint":opponentPoint]
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

