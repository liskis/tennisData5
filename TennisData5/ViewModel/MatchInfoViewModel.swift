import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = UUID().uuidString
    @Published var setId: String = UUID().uuidString
    @Published var gameId: String = UUID().uuidString
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var inputMode: InputMode = .beginner
    @Published var naviTitle: String = ""
    @Published var player1: String = "わたなべ"
    @Published var player2: String = ""
    @Published var player3: String = ""
    @Published var player4: String = ""
    
}
