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
    @Published var showPickerPartner: Bool = true
    @Published var showPickerOpponent: Bool = true
}
