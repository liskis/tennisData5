
import Foundation
import RealmSwift

class GameDataModel: Object,ObjectKeyIdentifiable, Codable {
    
    @Persisted var gameId: String
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var servOrRet: String
    @Persisted var gamePosition: String
    @Persisted var getPoint:Int
    @Persisted var lostPoint:Int
    @Persisted var gameStartDate: Date
    @Persisted var gameEndDate: Date
    
    /// Codableに必要なので記載.
    override init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case gameId
        case setId
        case matchId
        case servOrRet
        case gamePosition
        case getPoint
        case lostPoint
        case gameStartDate
        case gameEndDate
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gameId = try container.decode(String.self, forKey: .gameId)
        setId = try container.decode(String.self, forKey: .setId)
        matchId = try container.decode(String.self, forKey: .matchId)
        servOrRet = try container.decode(String.self, forKey: .servOrRet)
        gamePosition = try container.decode(String.self, forKey: .gamePosition)
        getPoint = try container.decode(Int.self, forKey: .getPoint)
        lostPoint = try container.decode(Int.self, forKey: .lostPoint)
        gameStartDate = try container.decode(Date.self, forKey: .gameStartDate)
        gameEndDate = try container.decode(Date.self, forKey: .gameEndDate)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gameId, forKey: .gameId)
        try container.encode(setId, forKey: .setId)
        try container.encode(matchId, forKey: .matchId)
        try container.encode(servOrRet, forKey: .servOrRet)
        try container.encode(gamePosition, forKey: .gamePosition)
        try container.encode(getPoint, forKey: .getPoint)
        try container.encode(lostPoint, forKey: .lostPoint)
        try container.encode(gameStartDate, forKey: .gameStartDate)
        try container.encode(gameEndDate, forKey: .gameEndDate)
    }
}
