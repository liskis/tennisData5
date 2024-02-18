import Foundation
enum GameType: String ,CaseIterable, Decodable {
    case noSelection
    case pointGame
    case setMatch
    case tieBreak
    var forString: String {
        switch self {
            case .noSelection : return "全て"
            case .pointGame: return "ポイントゲーム"
            case .setMatch : return "セットマッチ"
            case .tieBreak : return "タイブレーク"
        }
    }
}
