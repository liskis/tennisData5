import Foundation
import RealmSwift
class AllViewModelWCModel: Codable {
    var homeVM = HomeViewModel()
    var matchInfoVM = MatchInfoViewModel()
    var positionVM = PositionViewModel()
    var pointVM = PointViewModel()
    var userVM = UserViewModel()
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case homeVM
        case matchInfoVM
        case positionVM
        case pointVM
        case userVM
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        homeVM = try container.decode(HomeViewModel.self, forKey: .homeVM)
        matchInfoVM = try container.decode(MatchInfoViewModel.self, forKey: .matchInfoVM)
        positionVM = try container.decode(PositionViewModel.self, forKey: .positionVM)
        pointVM = try container.decode(PointViewModel.self, forKey: .pointVM)
        userVM = try container.decode(UserViewModel.self, forKey: .userVM)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(homeVM, forKey: .homeVM)
        try container.encode(matchInfoVM, forKey: .matchInfoVM)
        try container.encode(positionVM, forKey: .positionVM)
        try container.encode(pointVM, forKey: .pointVM)
        try container.encode(userVM, forKey: .userVM)
    }
}
