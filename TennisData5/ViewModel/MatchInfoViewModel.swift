import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var machStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
}
