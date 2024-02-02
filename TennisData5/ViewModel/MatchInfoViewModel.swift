import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = UUID().uuidString
    @Published var setId: String = UUID().uuidString
    @Published var gameId: String = UUID().uuidString
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var inputMode: InputMode = .beginner
    @Published var teamAplayer1id: String = ""
    @Published var teamAplayer2id: String = ""
    @Published var teamBplayer1id: String = ""
    @Published var teamBplayer2id: String = ""
    @Published var tactics: String = ""
    @Published var matchEnd: String = ""
    @Published var matchEndDate: Date = Date()
    @Published var naviTitle: String = ""
    @Published var myName: String = "ゲスト"
}
