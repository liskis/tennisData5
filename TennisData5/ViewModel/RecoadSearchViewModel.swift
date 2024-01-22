import Foundation
import SwiftUI
class RecordSearchViewModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var searchStartDate: Date = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @Published var seatchEndDate: Date = Date()
    @Published var partner: String = ""
    @Published var opponent: String = ""
    @Published var matchRecoad: [MatchRecordModel] = [
        .init(matchId: "0", matchStartDate: "2024/ 1/ 1", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: "2024/ 1/ 2", matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: "2024/ 1/ 3", matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: "2024/ 1/24", matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: "2024/ 1/15", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "0", matchStartDate: "2024/12/ 1", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: "2024/12/20", matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: "2024/1/3", matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: "2024/1/4", matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: "2024/1/5", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "0", matchStartDate: "2024/1/1", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: "2024/1/2", matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: "2024/1/3", matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: "2024/1/4", matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: "2024/1/5", matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0)
    ]
}
