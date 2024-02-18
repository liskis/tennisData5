import Foundation
import RealmSwift
class UserViewModel: ObservableObject, Codable {
    @Published var showingPopUp: Bool = false
    @Published var levelAndModePopUp: Bool = false
    @Published var myName: String = "ゲスト"
    @Published var dominant: Dominant = .noSelection
    @Published var gender: Gender = .noSelection
    
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case myName
        case dominant
        case gender
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        myName = try container.decode(String.self, forKey: .myName)
        dominant = try container.decode(Dominant.self, forKey: .dominant)
        gender = try container.decode(Gender.self, forKey: .gender)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(myName, forKey: .myName)
        try container.encode(dominant.rawValue, forKey: .dominant)
        try container.encode(gender.rawValue, forKey: .gender)
        
    }
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    func updateUserInfo(){
        let userInfo = realm.objects(UserModel.self).where({ $0.relation == "me" })
        if userInfo.count == 1 {
            change(userInfo: userInfo.first!)
        } else {
            registration()
        }
        showRealm()
    }
    
    func change(userInfo: UserModel){
        try! realm.write{
            userInfo.myName = myName
            userInfo.dominant = dominant.rawValue
            userInfo.gender = gender.rawValue
            userInfo.modified = Date()
        }
    }
    
    func registration(){
        let userModel = UserModel()
        try! realm.write{
            userModel.id = UUID().uuidString
            userModel.myName = myName
            userModel.dominant = dominant.rawValue
            userModel.gender = gender.rawValue
            userModel.relation = "me"
            userModel.created = Date()
            realm.add(userModel)
        }
    }
    func setUserInfo(){
        let userInfo = realm.objects(UserModel.self).where({ $0.relation == "me" })
        if  userInfo.count == 1 {
            myName = userInfo[0].myName
            dominant = Dominant(rawValue: userInfo[0].dominant)!
            gender = Gender(rawValue: userInfo[0].gender)!
        }
    }
    func showRealm(){
        let results = realm.objects(UserModel.self)
        print(results)
    }
    func deleteRealm(){
        let results = realm.objects(UserModel.self)
        try! realm.write {
            realm.delete(results)
        }
    }
}
