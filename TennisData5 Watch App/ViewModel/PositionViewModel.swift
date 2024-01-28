import Foundation
class PositionViewModel: ObservableObject {
    @Published var servOrRet: ServOrRet = .noSelection
    @Published var position: Position = .NoSelection
    @Published var server: Server = .noSelection
    
    func resetModel(){
        servOrRet = .noSelection
        position = .NoSelection
        server = .noSelection
    }
}
