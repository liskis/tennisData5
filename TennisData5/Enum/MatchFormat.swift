import Foundation
enum MatchFormat: String, CaseIterable, Decodable {
    case noSelection
    case singles
    case doubles
    var forString: String {
        switch self {
            case .noSelection : return "全て"
            case .singles: return "シングルス"
            case .doubles : return "ダブルス"
        }
    }
}
