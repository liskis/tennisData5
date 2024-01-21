import Foundation
class MatchInfoViewModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var naviTitle: String = ""
    @Published var searchStartDate: Date = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @Published var seatchEndDate: Date = Date()
    
    func resetModel(){
        matchId = ""
        setId = ""
        gameId = ""
        matchStartDate = Date()
        matchFormat = .noSelection
        gameType = .noSelection
    }
    
}
