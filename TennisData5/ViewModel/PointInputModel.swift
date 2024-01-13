//
//  PointInputModel.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/12.
//

import Foundation
class PointInputModel: ObservableObject {
    let matchId:String = UUID().uuidString
    let setId: String = UUID().uuidString
    let machStartDate: Date = Date()
    @Published var gameId: String = UUID().uuidString
    @Published var matchFormat: MatchFormat = .singles
    @Published var gameType: GameType = .pointGame
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
