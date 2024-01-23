import Foundation
struct MatchRecordModel: Identifiable {
    var id: String = UUID().uuidString
    var matchId: String
    var matchStartDate: Date
    var matchFormat: MatchFormat
    var gameType: GameType
    var WinScore: Int
    var LoseScore: Int
    var DrawScore: Int
}
