import RealmSwift
import SwiftUI
class DataManageViewModel: ObservableObject {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    
    func pointRecoad(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 5)
        let realm = try! Realm()
        let pointDataModel = PointDataModel()
        try! realm.write{
            pointDataModel.id = UUID().uuidString
            pointDataModel.matchId = matchInfoVM.matchId
            pointDataModel.setId = matchInfoVM.setId
            pointDataModel.gameId = matchInfoVM.gameId
            pointDataModel.matchStartDate = matchInfoVM.matchStartDate
            pointDataModel.matchFormat = matchInfoVM.matchFormat.rawValue
            pointDataModel.gemeType = matchInfoVM.gameType.rawValue
            pointDataModel.inputMode = matchInfoVM.inputMode.rawValue
            pointDataModel.teamAplayer1id = matchInfoVM.teamAplayer1id
            pointDataModel.teamAplayer2id = matchInfoVM.teamAplayer2id
            pointDataModel.teamBplayer1id = matchInfoVM.teamBplayer1id
            pointDataModel.teamBplayer2id = matchInfoVM.teamBplayer2id
            pointDataModel.tactics = matchInfoVM.tactics
            pointDataModel.matchEnd = matchInfoVM.matchEnd
            pointDataModel.matchEndDate = matchInfoVM.matchEndDate
            pointDataModel.servOrRet = positionVM.servOrRet.rawValue
            pointDataModel.side = positionVM.side.rawValue
            pointDataModel.myPosition = positionVM.myPosition.rawValue
            pointDataModel.teamAplayer1position = positionVM.teamAplayer1position.rawValue
            pointDataModel.teamAplayer2position = positionVM.teamAplayer2position.rawValue
            pointDataModel.teamBplayer1position = positionVM.teamBplayer1position.rawValue
            pointDataModel.teamBplayer2position = positionVM.teamBplayer2position.rawValue
            pointDataModel.server = positionVM.server.rawValue
            pointDataModel.tactics = positionVM.tactics.rawValue
            pointDataModel.winCount = pointVM.winCount
            pointDataModel.loseCount = pointVM.loseCount
            pointDataModel.drowCount = pointVM.drowCount
            pointDataModel.myPoint = pointVM.myPoint
            pointDataModel.opponentPoint = pointVM.opponentPoint
            pointDataModel.service = pointVM.service.rawValue
            pointDataModel.getPoint = pointVM.getPoint.rawValue
            pointDataModel.shot = pointVM.shot.rawValue
            pointDataModel.whose = pointVM.whose.rawValue
            realm.add(pointDataModel)
        }
    }
    
    func goBack(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 5)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        if results.count != 0 {
            if pointVM.allPoint + pointVM.allgameCount != 0 {
                positionVM.myPosition = Position(rawValue: results.last!.myPosition)!
                positionVM.servOrRet = ServOrRet(rawValue: results.last!.servOrRet)!
                positionVM.side = Side(rawValue: results.last!.side)!
                pointVM.service = Service(rawValue: results.last!.service)!
                if pointVM.allPoint == 1 {
                    pointVM.myPoint = 0
                    pointVM.opponentPoint = 0
                    if let result = results.last {
                        try! realm.write() {
                            realm.delete(result)
                        }
                    }
                } else if pointVM.allPoint == 0 {
                    positionVM.myPosition = .noSelection
                    positionVM.servOrRet = ServOrRet(rawValue: results.last!.servOrRet)!
                    positionVM.side = .noSelection
                    pointVM.service = .first
                    pointVM.winCount = results.last!.winCount
                    pointVM.loseCount = results.last!.loseCount
                    pointVM.drowCount = results.last!.drowCount
                    pointVM.myPoint = results.last!.myPoint
                    pointVM.opponentPoint = results.last!.opponentPoint
                    matchInfoVM.gameId = results.last!.gameId
                    if let result = results.last {
                        try! realm.write() {
                            realm.delete(result)
                        }
                    }
                } else {
                    if let result = results.last {
                        try! realm.write() {
                            realm.delete(result)
                        }
                    }
                    
                    let results = realm.objects(PointDataModel.self)
                    pointVM.winCount = results.last!.winCount
                    pointVM.loseCount = results.last!.loseCount
                    pointVM.drowCount = results.last!.drowCount
                    pointVM.myPoint = results.last!.myPoint
                    pointVM.opponentPoint = results.last!.opponentPoint
                    matchInfoVM.gameId = results.last!.gameId
                }
            }
        }
    }
    
    func showRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 5)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        print(results)
    }
    func deleteRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 5)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        try! realm.write {
            realm.delete(results)
        }
    }
}
