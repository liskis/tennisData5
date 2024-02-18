import Foundation
import SwiftUI
class RecordSearchViewModel: ObservableObject {
    @ObservedObject var homeVM = HomeViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var pointVM = PointViewModel()
    @Published var searchStartDateString: String = Date.DateToString(date: Date.plusYear(date: Date(), value: -1))
    @Published var searchEndDateString: String = Date.DateToString(date: Date())
    @Published var searchStartDate: Date = Date.plusYear(date: Date(), value: -1).zeroClock
    @Published var searchEndDate: Date = Date().endClock
    @Published var partner: String = ""
    @Published var opponent: String = ""
    @Published var matchRecoad: [MatchRecordModel] = [
//        .init(matchId: "0", matchStartDate: Date(), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "0", matchStartDate: Date.plusDay(date: Date(), value: -1), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "1", matchStartDate: Date.plusDay(date: Date(), value: -2), matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
//        .init(matchId: "2", matchStartDate: Date.plusDay(date: Date(), value: -3), matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
//        .init(matchId: "3", matchStartDate: Date.plusDay(date: Date(), value: -4), matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
//        .init(matchId: "4", matchStartDate: Date.plusDay(date: Date(), value: -5), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "0", matchStartDate: Date.plusDay(date: Date(), value: -6), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "1", matchStartDate: Date.plusDay(date: Date(), value: -7), matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
//        .init(matchId: "2", matchStartDate: Date.plusDay(date: Date(), value: -8), matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
//        .init(matchId: "3", matchStartDate: Date.plusDay(date: Date(), value: -9), matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
//        .init(matchId: "4", matchStartDate: Date.plusDay(date: Date(), value: -10), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "0", matchStartDate: Date.plusDay(date: Date(), value: -11), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0),
//        .init(matchId: "1", matchStartDate: Date.plusDay(date: Date(), value: -12), matchFormat: .doubles, gameType: .pointGame, WinScore: 2, LoseScore: 3, DrawScore: 1),
//        .init(matchId: "2", matchStartDate: Date.plusDay(date: Date(), value: -13), matchFormat: .singles, gameType: .pointGame, WinScore: 4, LoseScore: 0, DrawScore: 0),
//        .init(matchId: "3", matchStartDate: Date.plusDay(date: Date(), value: -14), matchFormat: .doubles, gameType: .pointGame, WinScore: 3, LoseScore: 3, DrawScore: 0),
//        .init(matchId: "4", matchStartDate: Date.plusDay(date: Date(), value: -15), matchFormat: .singles, gameType: .pointGame, WinScore: 3, LoseScore: 2, DrawScore: 0)
    ]
}
