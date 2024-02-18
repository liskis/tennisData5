import SwiftUI
import RealmSwift
class PointViewModel: ObservableObject, Codable {
    @Published var getSetCount: Int = 0
    @Published var lostSetCount: Int = 0
    @Published var drowSetCount: Int = 0
    @Published var getGameCount: Int = 0
    @Published var lostGameCount: Int = 0
    @Published var drowGameCount: Int = 0
    @Published var getPoint: Int = 0
    @Published var lostPoint: Int = 0
    @Published var service: Service = .first
    @Published var whichPoint: WhichPoint = .noSelection
    @Published var shot: Shot = .noSelection
    @Published var whose: Whose = .noSelection
    @Published var tactics: Tactics = .noSelection
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case getSetCount
        case lostSetCount
        case drowSetCount
        case getGameCount
        case lostGameCount
        case drowGameCount
        case getPoint
        case lostPoint
        case service
        case whichPoint
        case shot
        case whose
        case tactics
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        getSetCount = try container.decode(Int.self, forKey: .getSetCount)
        lostSetCount = try container.decode(Int.self, forKey: .lostSetCount)
        drowSetCount = try container.decode(Int.self, forKey: .drowSetCount)
        getGameCount = try container.decode(Int.self, forKey: .getGameCount)
        lostGameCount = try container.decode(Int.self, forKey: .lostGameCount)
        drowGameCount = try container.decode(Int.self, forKey: .drowGameCount)
        getPoint = try container.decode(Int.self, forKey: .getPoint)
        lostPoint = try container.decode(Int.self, forKey: .lostPoint)
        service = try container.decode(Service.self, forKey: .service)
        whichPoint = try container.decode(WhichPoint.self, forKey: .whichPoint)
        shot = try container.decode(Shot.self, forKey: .shot)
        whose = try container.decode(Whose.self, forKey: .whose)
        tactics = try container.decode(Tactics.self, forKey: .tactics)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(getSetCount, forKey: .getSetCount)
        try container.encode(lostSetCount, forKey: .lostSetCount)
        try container.encode(drowSetCount, forKey: .drowSetCount)
        try container.encode(getGameCount, forKey: .getGameCount)
        try container.encode(lostGameCount, forKey: .lostGameCount)
        try container.encode(drowGameCount, forKey: .drowGameCount)
        try container.encode(getPoint, forKey: .getPoint)
        try container.encode(lostPoint, forKey: .lostPoint)
        try container.encode(service.rawValue, forKey: .service)
        try container.encode(whichPoint.rawValue, forKey: .whichPoint)
        try container.encode(shot.rawValue, forKey: .shot)
        try container.encode(whose.rawValue, forKey: .whose)
        try container.encode(tactics.rawValue, forKey: .tactics)
    }
    var allPoint: Int {
        getPoint + lostPoint
    }
    var allgameCount: Int {
        getGameCount + lostGameCount + drowGameCount
    }
    var allCount: Int {
        allPoint + allgameCount
    }
    func returnInitialValue(){
        getSetCount = 0
        lostSetCount = 0
        drowSetCount = 0
        getGameCount = 0
        lostGameCount = 0
        drowGameCount = 0
        getPoint = 0
        lostPoint = 0
        service = .first
        whichPoint = .noSelection
        shot = .noSelection
        whose = .noSelection
        tactics = .noSelection
    }
}
