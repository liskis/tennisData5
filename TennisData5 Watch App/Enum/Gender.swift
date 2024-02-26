
import Foundation

enum Gender: String ,CaseIterable, Decodable  {

    case noSelection
    case male
    case female
    case other
    var forString: String {
        switch self {
            case .noSelection : return "選択しない"
            case .male: return "男性"
            case .female : return "女性"
            case .other: return "その他"
        }
    }
}
