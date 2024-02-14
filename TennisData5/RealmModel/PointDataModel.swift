import RealmSwift
class PointDataModel: Object,ObjectKeyIdentifiable, Codable {
    @Persisted var pointId: String
    @Persisted var gameId: String
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var servOrRet: String
    @Persisted var side: String
    @Persisted var myPosition: String
    @Persisted var server: String
    @Persisted var getGameCount:Int
    @Persisted var lostGameCount:Int
    @Persisted var drowGameCount:Int
    @Persisted var getPoint:Int
    @Persisted var lostPoint:Int
    @Persisted var service: String
    @Persisted var whichPoint: String
    @Persisted var shot: String
    @Persisted var whose: String
    @Persisted var tactics: String
    @Persisted var dateTime: Date
    /// Codableに必要なので記載.
    override init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case pointId
        case gameId
        case setId
        case matchId
        case servOrRet
        case side
        case myPosition
        case server
        case getGameCount
        case lostGameCount
        case drowGameCount
        case getPoint
        case lostPoint
        case service
        case whichPoint
        case shot
        case whose
        case tactics
        case dateTime
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        pointId = try container.decode(String.self, forKey: .pointId)
        gameId = try container.decode(String.self, forKey: .gameId)
        setId = try container.decode(String.self, forKey: .setId)
        matchId = try container.decode(String.self, forKey: .matchId)
        servOrRet = try container.decode(String.self, forKey: .servOrRet)
        side = try container.decode(String.self, forKey: .side)
        myPosition = try container.decode(String.self, forKey: .myPosition)
        server = try container.decode(String.self, forKey: .server)
        getGameCount = try container.decode(Int.self, forKey: .getGameCount)
        lostGameCount = try container.decode(Int.self, forKey: .lostGameCount)
        drowGameCount = try container.decode(Int.self, forKey: .drowGameCount)
        getPoint = try container.decode(Int.self, forKey: .getPoint)
        lostPoint = try container.decode(Int.self, forKey: .getPoint)
        service = try container.decode(String.self, forKey: .service)
        whichPoint = try container.decode(String.self, forKey: .whichPoint)
        shot = try container.decode(String.self, forKey: .shot)
        whose = try container.decode(String.self, forKey: .whose)
        tactics = try container.decode(String.self, forKey: .tactics)
        dateTime = try container.decode(Date.self, forKey: .dateTime)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pointId, forKey: .pointId)
        try container.encode(gameId, forKey: .gameId)
        try container.encode(setId, forKey: .setId)
        try container.encode(matchId, forKey: .matchId)
        try container.encode(servOrRet, forKey: .servOrRet)
        try container.encode(side, forKey: .side)
        try container.encode(myPosition, forKey: .myPosition)
        try container.encode(server, forKey: .server)
        try container.encode(getGameCount, forKey: .getGameCount)
        try container.encode(lostGameCount, forKey: .lostGameCount)
        try container.encode(drowGameCount, forKey: .drowGameCount)
        try container.encode(getPoint, forKey: .getPoint)
        try container.encode(lostPoint, forKey: .lostPoint)
        try container.encode(service, forKey: .service)
        try container.encode(whichPoint, forKey: .whichPoint)
        try container.encode(shot, forKey: .shot)
        try container.encode(whose, forKey: .whose)
        try container.encode(tactics, forKey: .tactics)
        try container.encode(dateTime, forKey: .dateTime)
    }
}
