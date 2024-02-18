import Foundation
class PositionViewModel: ObservableObject, Codable {
    @Published var servOrRet: ServOrRet = .noSelection
    @Published var side: Side = .duceSide
    @Published var myPosition: Position = .noSelection
    @Published var gamePosition: GamePosition = .noSelection
    @Published var teamAplayer1position: Position = .noSelection
    @Published var teamAplayer2position: Position = .noSelection
    @Published var teamBplayer1position: Position = .noSelection
    @Published var teamBplayer2position: Position = .noSelection
    @Published var server: Server = .noSelection
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case servOrRet
        case side
        case myPosition
        case gamePosition
        case teamAplayer1position
        case teamAplayer2position
        case teamBplayer1position
        case teamBplayer2position
        case server
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        servOrRet = try container.decode(ServOrRet.self, forKey: .servOrRet)
        side = try container.decode(Side.self, forKey: .side)
        myPosition = try container.decode(Position.self, forKey: .myPosition)
        gamePosition = try container.decode(GamePosition.self, forKey: .gamePosition)
        teamAplayer1position = try container.decode(Position.self, forKey: .teamAplayer1position)
        teamAplayer2position = try container.decode(Position.self, forKey: .teamAplayer2position)
        teamBplayer1position = try container.decode(Position.self, forKey: .teamBplayer1position)
        teamBplayer2position = try container.decode(Position.self, forKey: .teamBplayer2position)
        server = try container.decode(Server.self, forKey: .server)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(servOrRet.rawValue, forKey: .servOrRet)
        try container.encode(side.rawValue, forKey: .side)
        try container.encode(myPosition.rawValue, forKey: .myPosition)
        try container.encode(gamePosition.rawValue, forKey: .gamePosition)
        try container.encode(teamAplayer1position.rawValue, forKey: .teamAplayer1position)
        try container.encode(teamAplayer2position.rawValue, forKey: .teamAplayer2position)
        try container.encode(teamBplayer1position.rawValue, forKey: .teamBplayer1position)
        try container.encode(teamBplayer2position.rawValue, forKey: .teamBplayer2position)
        try container.encode(server.rawValue, forKey: .server)
        
    }
    func returnInitialValue(){
        servOrRet = .noSelection
        side = .duceSide
        myPosition = .noSelection
        gamePosition = .noSelection
        teamAplayer1position = .noSelection
        teamAplayer2position = .noSelection
        teamBplayer1position = .noSelection
        teamBplayer2position = .noSelection
        server = .noSelection
    }
}
   
