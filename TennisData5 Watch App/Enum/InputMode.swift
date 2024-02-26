
import Foundation

enum InputMode: String ,CaseIterable, Decodable {

    case beginner
    case advance
    case highLebel
    case expert
    var forString: String {
        switch self {
            case .beginner : return "ビギナーモード"
            case .advance: return "アドバンスモード"
            case .highLebel : return "ハイレベルモード"
            case .expert : return "エキスパートモード"
        }
    }
}
