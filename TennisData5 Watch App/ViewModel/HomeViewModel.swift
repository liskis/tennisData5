import Foundation
import RealmSwift
class HomeViewModel: ObservableObject {
    @Published var latestMatch: MatchRecordModel = .init(
        matchId: "",
        matchStartDate: Date(),
        matchFormat: .noSelection,
        gameType: .noSelection,
        WinScore: 0,
        LoseScore: 0,
        DrawScore: 0
    )
    func setLatestMatch(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let matchData = realm.objects(MatchDataModel.self).last
        let setData = realm.objects(SetDataModel.self).last
        if matchData != nil && setData != nil {
            latestMatch = .init(
                matchId: matchData!.matchId,
                matchStartDate: matchData!.matchStartDate,
                matchFormat: MatchFormat(rawValue: matchData!.matchFormat)!,
                gameType: GameType(rawValue: matchData!.gemeType)!,
                WinScore: setData!.getGameCount,
                LoseScore: setData!.lostGameCount,
                DrawScore: setData!.drowGameCount
            )
        }
    }
}
