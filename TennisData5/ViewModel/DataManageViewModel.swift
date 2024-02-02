import RealmSwift
import SwiftUI
class DataManageViewModel: ObservableObject {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    func pointRecoad(){
        let pointData = PointDataModel()
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
        let realm = try! Realm()
        try! realm.write{
            pointData.id = UUID().uuidString
            pointData.matchId = matchInfoVM.matchId
            pointData.setId = matchInfoVM.setId
            pointData.gameId = matchInfoVM.gameId
            pointData.matchStartDate = matchInfoVM.matchStartDate
            pointData.matchFormat = matchInfoVM.matchFormat.rawValue
            pointData.gemeType = matchInfoVM.gameType.rawValue
            pointData.inputMode = matchInfoVM.inputMode.rawValue
            pointData.teamAplayer1id = matchInfoVM.teamAplayer1id
            pointData.teamAplayer2id = matchInfoVM.teamAplayer2id
            pointData.teamBplayer1id = matchInfoVM.teamBplayer1id
            pointData.teamBplayer2id = matchInfoVM.teamBplayer2id
            pointData.tactics = matchInfoVM.tactics
            pointData.matchEnd = matchInfoVM.matchEnd
            pointData.matchEndDate = matchInfoVM.matchEndDate
            pointData.servOrRet = positionVM.servOrRet.rawValue
            pointData.side = positionVM.side.rawValue
            pointData.myPosition = positionVM.myPosition.rawValue
            pointData.teamAplayer1position = positionVM.teamAplayer1position.rawValue
            pointData.teamAplayer2position = positionVM.teamAplayer2position.rawValue
            pointData.teamBplayer1position = positionVM.teamBplayer1position.rawValue
            pointData.teamBplayer2position = positionVM.teamBplayer2position.rawValue
            pointData.server = positionVM.server.rawValue
            pointData.tactics = positionVM.tactics.rawValue
            pointData.winCount = pointVM.winCount
            pointData.loseCount = pointVM.loseCount
            pointData.drowCount = pointVM.drowCount
            pointData.myPoint = pointVM.myPoint
            pointData.opponentPoint = pointVM.opponentPoint
            pointData.service = pointVM.service.rawValue
            pointData.getPoint = pointVM.getPoint.rawValue
            pointData.shot = pointVM.shot.rawValue
            pointData.whose = pointVM.whose.rawValue
            
            
            realm.add(pointData)
        }
    }
    
    func showRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        print(results)
    }
    func deleteRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        try! realm.write {
            realm.delete(results)
        }
    }
}
