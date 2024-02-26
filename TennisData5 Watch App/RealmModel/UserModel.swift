
import RealmSwift

class UserModel: Object,ObjectKeyIdentifiable, Codable {

    @Persisted var id: String
    @Persisted var myName: String
    @Persisted var dominant: String
    @Persisted var gender: String
    @Persisted var relation: String
    @Persisted var created: Date
    @Persisted var modified: Date
    
    /// Codableに必要なので記載.
    override init() {}
    
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case id
        case myName
        case dominant
        case gender
        case relation
        case created
        case modified
    }
    
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        myName = try container.decode(String.self, forKey: .myName)
        dominant = try container.decode(String.self, forKey: .dominant)
        gender = try container.decode(String.self, forKey: .gender)
        relation = try container.decode(String.self, forKey: .relation)
        created = try container.decode(Date.self, forKey: .created)
        modified = try container.decode(Date.self, forKey: .modified)
    }
    
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(myName, forKey: .myName)
        try container.encode(dominant, forKey: .dominant)
        try container.encode(gender, forKey: .gender)
        try container.encode(relation, forKey: .relation)
        try container.encode(created, forKey: .created)
        try container.encode(modified, forKey: .modified)
    }
}
