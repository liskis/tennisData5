import SwiftUI
class PointViewModel: ObservableObject {
    @Published var winCount:Int = 0
    @Published var loseCount:Int = 0
    @Published var drowCount:Int = 0
    @Published var myPoint:Int = 0
    @Published var opponentPoint:Int = 0
    @Published var service: Service = .first
    @Published var getPoint: GetPoint = .myTeam
    func resetModel(){
        winCount = 0
        loseCount = 0
        drowCount = 0
        myPoint = 0
        opponentPoint = 0
        service = .first
        getPoint = .myTeam
    }
}
