import SwiftUI
import RealmSwift
class PointViewModel: ObservableObject {
    @Published var getSetCount: Int = 0
    @Published var lostSetCount: Int = 0
    @Published var drowSetCount: Int = 0
    @Published var getGameCount: Int = 0
    @Published var lostGameCount: Int = 0
    @Published var drowGameCount: Int = 0
    @Published var getPoint: Int = 0
    @Published var lostPoint: Int = 0
    @Published var service: Service = .first
    @Published var whichPoint: WhichPoint = .noSelection
    @Published var shot: Shot = .noSelection
    @Published var whose: Whose = .noSelection
    @Published var tactics: Tactics = .noSelection
    var allPoint: Int {
        getPoint + lostPoint
    }
    var allgameCount: Int {
        getGameCount + lostGameCount + drowGameCount
    }
}
