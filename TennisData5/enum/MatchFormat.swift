import Foundation
enum MatchFormat: CaseIterable {
    case noSelection
    case singles
    case doubles
    var selectionName: String {
        switch self {
            case .noSelection : return "全て"
            case .singles: return "シングルス"
            case .doubles : return "ダブルス"
        }
    }
}
