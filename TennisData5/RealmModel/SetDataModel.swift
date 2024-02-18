import Foundation
import RealmSwift
class SetDataModel: Object,ObjectKeyIdentifiable, Codable {
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var getGameCount:Int
    @Persisted var lostGameCount:Int
    @Persisted var drowGameCount:Int
    @Persisted var setStartDate: Date
    @Persisted var setEndDate: Date
    /// Codableに必要なので記載.
    override init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case setId
        case matchId
        case getGameCount
        case lostGameCount
        case drowGameCount
        case setStartDate
        case setEndDate
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        setId = try container.decode(String.self, forKey: .setId)
        matchId = try container.decode(String.self, forKey: .matchId)
        getGameCount = try container.decode(Int.self, forKey: .getGameCount)
        lostGameCount = try container.decode(Int.self, forKey: .lostGameCount)
        drowGameCount = try container.decode(Int.self, forKey: .drowGameCount)
        setStartDate = try container.decode(Date.self, forKey: .setStartDate)
        setEndDate = try container.decode(Date.self, forKey: .setEndDate)
        
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(setId, forKey: .setId)
        try container.encode(matchId, forKey: .matchId)
        try container.encode(getGameCount, forKey: .getGameCount)
        try container.encode(lostGameCount, forKey: .lostGameCount)
        try container.encode(drowGameCount, forKey: .drowGameCount)
        try container.encode(setStartDate, forKey: .setStartDate)
        try container.encode(setEndDate, forKey: .setEndDate)
    }
}
