import RealmSwift
import SwiftUI
class DataManageViewModel: ObservableObject {
    @Published var pointData = PointDataModel()
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    
    func pointRecoad(){
        let realm = try! Realm()
        try! realm.write{
            pointData.id = UUID().uuidString
            pointData.matchId = matchInfoVM.matchId
            pointData.setId = matchInfoVM.setId
            pointData.gameId = matchInfoVM.gameId
            pointData.matchStartDate = matchInfoVM.matchStartDate
            pointData.inputMode = matchInfoVM.inputMode.rawValue
            pointData.matchFormat = matchInfoVM.matchFormat.rawValue
            pointData.gemeType = matchInfoVM.gameType.rawValue
            pointData.player1id = matchInfoVM.player1
            pointData.player2id = matchInfoVM.player2
            pointData.player3id = matchInfoVM.player3
            pointData.player4id = matchInfoVM.player4
            pointData.servOrRet = positionVM.servOrRet.rawValue
            pointData.player1position = positionVM.position.rawValue
            pointData.player2position = positionVM.Player2Position.rawValue
            pointData.player3position = positionVM.Player3Position.rawValue
            pointData.player4position = positionVM.Player4Position.rawValue
            pointData.server = positionVM.server.rawValue
            pointData.service = pointVM.service.rawValue
            pointData.getPoint = pointVM.getPoint.rawValue
            pointData.shot = pointVM.shot.rawValue
            pointData.whose = pointVM.whose.rawValue
            
            realm.add(pointData)
        }
    }
    func showRealm(){
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        print(Array(results))
    }
    func deleteRealm(){
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        try! realm.write {
            realm.delete(results)
        }
    }
}
