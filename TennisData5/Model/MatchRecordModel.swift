import Foundation
struct MatchRecordModel: Identifiable {
    var id: String
    var matchStartDate: Date
    var matchFormat: MatchFormat
    var gameType: GameType
    var WinScore: Int
    var LoseScore: Int
    var EvenScore: Int
}
