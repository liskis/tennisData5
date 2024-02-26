
import Foundation

enum Dominant: String ,CaseIterable, Decodable {
    
    case noSelection
    case right
    case left
    case both
    var forString: String {
        switch self {
            case .noSelection : return "選択しない"
            case .right: return "右きき"
            case .left : return "左きき"
            case .both: return "両きき"
        }
    }
}
