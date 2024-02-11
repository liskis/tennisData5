import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = UUID().uuidString
    @Published var setId: String = UUID().uuidString
    @Published var gameId: String = UUID().uuidString
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var inputMode: InputMode = .beginner
    @Published var teamAplayer1id: String = ""
    @Published var teamAplayer2id: String = ""
    @Published var teamBplayer1id: String = ""
    @Published var teamBplayer2id: String = ""
    @Published var tactics: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var setStartDate: Date = Date()
    @Published var gameStartDate: Date = Date()
    @Published var matchEndDate: Date = Date()
    @Published var naviTitle: String = ""
    func returnInitialValue(){
        matchId = UUID().uuidString
        setId = UUID().uuidString
        gameId = UUID().uuidString
        matchFormat = .noSelection
        gameType = .noSelection
        inputMode = .beginner
        teamAplayer1id = ""
        teamAplayer2id = ""
        teamBplayer1id = ""
        teamBplayer2id = ""
        tactics = ""
        matchStartDate = Date()
        setStartDate = Date()
        gameStartDate = Date()
        matchEndDate = Date()
        naviTitle = ""
    }
}
