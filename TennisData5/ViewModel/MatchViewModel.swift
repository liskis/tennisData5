import Foundation
class MatchViewModel: ObservableObject {
    @Published var pointVM = PointViewModel()
    @Published var matchInfoVM = MatchInfoViewModel()
    @Published var positionVM = PositionViewModel()
}
