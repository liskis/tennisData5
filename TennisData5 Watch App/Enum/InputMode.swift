import Foundation
enum InputMode: String ,CaseIterable {
    case beginner
    case advance
    case highLebel
    case expert
    var forString: String {
        switch self {
            case .beginner : return "ビギナー"
            case .advance: return "アドバンス"
            case .highLebel : return "ハイレベル"
            case .expert : return "エキスパート"
        }
    }
}
