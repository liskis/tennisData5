import Foundation
class PositionViewModel: ObservableObject {
    @Published var gameSide: GameSide = .noSelection
    @Published var position: Position = .NoSelection
    @Published var server: Server = .noSelection
}
