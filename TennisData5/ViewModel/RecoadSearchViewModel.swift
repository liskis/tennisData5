import Foundation
import SwiftUI
class RecordSearchViewModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var matchStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var searchStartDateString: String = "2023-01-24"
    @Published var searchEndDateString: String = "2024-01-23"
    @Published var searchStartDate: Date = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
    @Published var searchEndDate: Date = Date()
    @Published var partner: String = ""
    @Published var opponent: String = ""
    @Published var matchRecoad: [MatchRecordModel] = [
        .init(matchId: "0", matchStartDate: Calendar.current.date(byAdding: .day, value: -1, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: Calendar.current.date(byAdding: .day, value: -2, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: Calendar.current.date(byAdding: .day, value: -3, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: Calendar.current.date(byAdding: .day, value: -4, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: Calendar.current.date(byAdding: .day, value: -5, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "0", matchStartDate: Calendar.current.date(byAdding: .day, value: -6, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: Calendar.current.date(byAdding: .day, value: -7, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: Calendar.current.date(byAdding: .day, value: -8, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: Calendar.current.date(byAdding: .day, value: -9, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: Calendar.current.date(byAdding: .day, value: -10, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "0", matchStartDate: Calendar.current.date(byAdding: .day, value: -11, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
        .init(matchId: "1", matchStartDate: Calendar.current.date(byAdding: .day, value: -12, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
        .init(matchId: "2", matchStartDate: Calendar.current.date(byAdding: .day, value: -13, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
        .init(matchId: "3", matchStartDate: Calendar.current.date(byAdding: .day, value: -14, to: Date())!, matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
        .init(matchId: "4", matchStartDate: Calendar.current.date(byAdding: .day, value: -15, to: Date())!, matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0)
    ]
}
