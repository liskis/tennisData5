import Foundation
class PositionViewModel: ObservableObject {
    @Published var servOrRet: ServOrRet = .noSelection
    @Published var position: Position = .NoSelection
    @Published var Player2Position: Position = .NoSelection
    @Published var Player3Position: Position = .NoSelection
    @Published var Player4Position: Position = .NoSelection
    @Published var server: Server = .noSelection
}
   
