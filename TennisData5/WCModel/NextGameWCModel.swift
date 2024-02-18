import Foundation
import RealmSwift
class NextGameWCModel: Codable {
    var gameData = GameDataModel()
    var newGameId: String = ""
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case gameData
        case newGameId
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        gameData = try container.decode(GameDataModel.self, forKey: .gameData)
        newGameId = try container.decode(String.self, forKey: .newGameId)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(gameData, forKey: .gameData)
        try container.encode(newGameId, forKey: .newGameId)
    }
}
