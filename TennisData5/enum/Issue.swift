import Foundation
enum Issue: String{
    case Win
    case Lose
    case Draw
    var forString: String {
        switch self {
            case .Win : return "Win"
            case .Lose: return "Lose"
            case .Draw: return "Draw"
        }
    }
}
