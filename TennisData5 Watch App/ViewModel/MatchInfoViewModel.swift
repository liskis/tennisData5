import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .singles
    @Published var gameType: GameType = .pointGame
    @Published var naviTitle: String = ""
    @Published var player1: String = "わたなべ"
    @Published var player2: String = ""
    @Published var player3: String = ""
    @Published var player4: String = ""
    
    func resetModel(){
        matchId = ""
        setId = ""
        gameId = ""
        matchStartDate = Date()
        matchFormat = .noSelection
        gameType = .noSelection
    }
    
}
