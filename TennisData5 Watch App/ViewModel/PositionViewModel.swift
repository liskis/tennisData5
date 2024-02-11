import Foundation
class PositionViewModel: ObservableObject {
    @Published var servOrRet: ServOrRet = .noSelection
    @Published var side: Side = .duceSide
    @Published var myPosition: Position = .noSelection
    @Published var gamePosition: GamePosition = .noSelection
    @Published var teamAplayer1position: Position = .noSelection
    @Published var teamAplayer2position: Position = .noSelection
    @Published var teamBplayer1position: Position = .noSelection
    @Published var teamBplayer2position: Position = .noSelection
    @Published var server: Server = .noSelection
    @Published var tactics: Tactics = .noSelection
    func returnInitialValue(){
        servOrRet = .noSelection
        side = .duceSide
        myPosition = .noSelection
        gamePosition = .noSelection
        teamAplayer1position = .noSelection
        teamAplayer2position = .noSelection
        teamBplayer1position = .noSelection
        teamBplayer2position = .noSelection
        server = .noSelection
        tactics = .noSelection
    }
}
   
