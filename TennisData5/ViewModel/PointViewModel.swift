import SwiftUI
class PointViewModel: ObservableObject {
    @Published var winCount:Int = 0
    @Published var loseCount:Int = 0
    @Published var drowCount:Int = 0
    @Published var myPoint:Int = 0
    @Published var opponentPoint:Int = 0
    @Published var service: Service = .first
    @Published var getPoint: GetPoint = .noSelection
    @Published var shot: Shot = .noSelection
    @Published var whose: Whose = .noSelection
   
}
