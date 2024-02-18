import Foundation
enum Relation: String ,CaseIterable, Decodable  {
    case friend
    case other
    var forString: String {
        switch self {
            case .friend: return "友達"
            case .other: return "その他"
        }
    }
}
