import Foundation
class PositionAndServiceWCModel: Codable {
    var positionVM = PositionViewModel()
    var service: Service = .first
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case positionVM
        case service
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        positionVM = try container.decode(PositionViewModel.self, forKey: .positionVM)
        service = try container.decode(Service.self, forKey: .service)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(positionVM, forKey: .positionVM)
        try container.encode(service.rawValue, forKey: .service)
        
    }
}
