import Foundation
import RealmSwift
class AllRealmWCModel: Codable {
    var matchData: [MatchDataModel] = []
    var setData: [SetDataModel] = []
    var gameData: [GameDataModel] = []
    var pointData: [PointDataModel] = []
    var userData: [UserModel] = []
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case matchData
        case setData
        case gameData
        case pointData
        case userData
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        matchData = try container.decode([MatchDataModel].self, forKey: .matchData)
        setData = try container.decode([SetDataModel].self, forKey: .setData)
        gameData = try container.decode([GameDataModel].self, forKey: .gameData)
        pointData = try container.decode([PointDataModel].self, forKey: .pointData)
        userData = try container.decode([UserModel].self, forKey: .userData)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(matchData, forKey: .matchData)
        try container.encode(setData, forKey: .setData)
        try container.encode(gameData, forKey: .gameData)
        try container.encode(pointData, forKey: .pointData)
        try container.encode(userData, forKey: .userData)
    }
}
