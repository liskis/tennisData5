
import Foundation
import RealmSwift

class HomeViewModel: ObservableObject, Codable {
    
    @Published var toPointGameView: Bool = false
    @Published var toOneMatchDataView: Bool = false
    @Published var scrollToTop: Bool = false
    @Published var latestMatch: MatchRecordModel = .init(
        matchId: "",
        matchStartDate: Date(),
        matchFormat: .noSelection,
        gameType: .noSelection,
        WinScore: 0,
        LoseScore: 0,
        DrawScore: 0
    )
    
    /// Codableに必要なので記載.
    init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        
        case toPointGameView
        case toOneMatchDataView
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        toPointGameView = try container.decode(Bool.self, forKey: .toPointGameView)
        toOneMatchDataView = try container.decode(Bool.self, forKey: .toOneMatchDataView)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(toPointGameView, forKey: .toPointGameView)
        try container.encode(toOneMatchDataView, forKey: .toOneMatchDataView)
    }
    
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    
    func setHomeData(){
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
