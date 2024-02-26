
import Foundation

class MatchInfoViewModel: ObservableObject, Codable {
    
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var inputMode: InputMode = .beginner
    @Published var teamAplayer1id: String = ""
    @Published var teamAplayer2id: String = ""
    @Published var teamBplayer1id: String = ""
    @Published var teamBplayer2id: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var setStartDate: Date = Date()
    @Published var gameStartDate: Date = Date()
    @Published var matchEndDate: Date = Date()
    @Published var naviTitle: String = ""
    
    /// Codableに必要なので記載.
    init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case matchId
        case setId
        case gameId
        case matchFormat
        case gameType
        case inputMode
        case teamAplayer1id
        case teamAplayer2id
        case teamBplayer1id
        case teamBplayer2id
        case matchStartDate
        case matchEndDate
        case naviTitle
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        matchId = try container.decode(String.self, forKey: .matchId)
        setId = try container.decode(String.self, forKey: .setId)
        gameId = try container.decode(String.self, forKey: .gameId)
        matchFormat = try container.decode(MatchFormat.self, forKey: .matchFormat)
        gameType = try container.decode(GameType.self, forKey: .gameType)
        inputMode = try container.decode(InputMode.self, forKey: .inputMode)
        teamAplayer1id = try container.decode(String.self, forKey: .teamAplayer1id)
        teamAplayer2id = try container.decode(String.self, forKey: .teamAplayer2id)
        teamBplayer1id = try container.decode(String.self, forKey: .teamBplayer1id)
        teamBplayer2id = try container.decode(String.self, forKey: .teamBplayer2id)
        matchStartDate = try container.decode(Date.self, forKey: .matchStartDate)
        matchEndDate = try container.decode(Date.self, forKey: .matchEndDate)
        naviTitle = try container.decode(String.self, forKey: .naviTitle)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(matchId, forKey: .matchId)
        try container.encode(setId, forKey: .setId)
        try container.encode(gameId, forKey: .gameId)
        try container.encode(matchFormat.rawValue, forKey: .matchFormat)
        try container.encode(gameType.rawValue, forKey: .gameType)
        try container.encode(inputMode.rawValue, forKey: .inputMode)
        try container.encode(teamAplayer1id, forKey: .teamAplayer1id)
        try container.encode(teamAplayer2id, forKey: .teamAplayer2id)
        try container.encode(teamBplayer1id, forKey: .teamBplayer1id)
        try container.encode(teamBplayer2id, forKey: .teamBplayer2id)
        try container.encode(matchStartDate, forKey: .matchStartDate)
        try container.encode(matchEndDate, forKey: .matchEndDate)
        try container.encode(naviTitle, forKey: .naviTitle)
    }
    
    /// 全ての値を初期値に戻す
    func returnInitialValue(){
        matchId = ""
        setId = ""
        gameId = ""
        matchFormat = .noSelection
        gameType = .noSelection
        inputMode = .beginner
        teamAplayer1id = ""
        teamAplayer2id = ""
        teamBplayer1id = ""
        teamBplayer2id = ""
        matchStartDate = Date()
        setStartDate = Date()
        gameStartDate = Date()
        matchEndDate = Date()
        naviTitle = ""
    }
}
