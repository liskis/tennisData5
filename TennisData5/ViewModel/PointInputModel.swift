import SwiftUI
class PointInputModel: ObservableObject {
    @Published var matchId:String = ""
    @Published var setId: String = ""
    @Published var gameId: String = ""
    @Published var machStartDate: Date = Date()
    @Published var matchFormat: MatchFormat = .noSelection
    @Published var gameType: GameType = .noSelection
    @Published var gameSide: GameSide = .noSelection
    @Published var service: Service = .first
    @Published var position: Position = .NoSelection
    @Published var winCount:Int = 0
    @Published var loseCount:Int = 0
    @Published var drowCount:Int = 0
    @Published var myPoint:Int = 0
    @Published var opponentPoint:Int = 0
    @Published var server: Server = .noSelection
    @Published var getPoint: GetPoint = .myTeam
}
