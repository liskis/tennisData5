
import Foundation
import RealmSwift

class GameEndWCModel: Codable {
    
    var setData = SetDataModel()
    var matchData = MatchDataModel()
    
    /// Codableに必要なので記載.
    init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case setData
        case matchData
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        setData = try container.decode(SetDataModel.self, forKey: .setData)
        matchData = try container.decode(MatchDataModel.self, forKey: .matchData)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(setData, forKey: .setData)
        try container.encode(matchData, forKey: .matchData)
    }
}
