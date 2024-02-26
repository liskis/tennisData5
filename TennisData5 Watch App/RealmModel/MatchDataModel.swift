
import Foundation
import RealmSwift

class MatchDataModel: Object,ObjectKeyIdentifiable, Codable {

    @Persisted var matchId: String
    @Persisted var matchFormat: String
    @Persisted var gemeType: String
    @Persisted var inputMode: String
    @Persisted var teamAplayer1id: String
    @Persisted var teamAplayer2id: String
    @Persisted var teamBplayer1id: String
    @Persisted var teamBplayer2id: String
    @Persisted var getSetCount: Int
    @Persisted var lostSetCount: Int
    @Persisted var drowSetCount: Int
    @Persisted var matchStartDate: Date
    @Persisted var matchEndDate: Date
    
    /// Codableに必要なので記載.
    override init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case matchId
        case matchFormat
        case gemeType
        case inputMode
        case teamAplayer1id
        case teamAplayer2id
        case teamBplayer1id
        case teamBplayer2id
        case getSetCount
        case lostSetCount
        case drowSetCount
        case matchStartDate
        case matchEndDate
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        matchId = try container.decode(String.self, forKey: .matchId)
        matchFormat = try container.decode(String.self, forKey: .matchFormat)
        gemeType = try container.decode(String.self, forKey: .gemeType)
        inputMode = try container.decode(String.self, forKey: .inputMode)
        teamAplayer1id = try container.decode(String.self, forKey: .teamAplayer1id)
        teamAplayer2id = try container.decode(String.self, forKey: .teamAplayer2id)
        teamBplayer1id = try container.decode(String.self, forKey: .teamBplayer1id)
        teamBplayer2id = try container.decode(String.self, forKey: .teamBplayer2id)
        getSetCount = try container.decode(Int.self, forKey: .getSetCount)
        lostSetCount = try container.decode(Int.self, forKey: .lostSetCount)
        drowSetCount = try container.decode(Int.self, forKey: .drowSetCount)
        matchStartDate = try container.decode(Date.self, forKey: .matchStartDate)
        matchEndDate = try container.decode(Date.self, forKey: .matchEndDate)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(matchId, forKey: .matchId)
        try container.encode(matchFormat, forKey: .matchFormat)
        try container.encode(gemeType, forKey: .gemeType)
        try container.encode(inputMode, forKey: .inputMode)
        try container.encode(teamAplayer1id, forKey: .teamAplayer1id)
        try container.encode(teamAplayer2id, forKey: .teamAplayer2id)
        try container.encode(teamBplayer1id, forKey: .teamBplayer1id)
        try container.encode(teamBplayer2id, forKey: .teamBplayer2id)
        try container.encode(getSetCount, forKey: .getSetCount)
        try container.encode(lostSetCount, forKey: .lostSetCount)
        try container.encode(drowSetCount, forKey: .drowSetCount)
        try container.encode(matchStartDate, forKey: .matchStartDate)
        try container.encode(matchEndDate, forKey: .matchEndDate)
    }
}
