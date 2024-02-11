import Foundation
import RealmSwift
class UserViewModel: ObservableObject {
    @Published var myName: String = "ゲスト"
    @Published var dominant: Dominant = .noSelection
    @Published var gender: Gender = .noSelection
    @Published var relation: String = "me"
    @Published var inputMode: InputMode = .beginner
    
    
    func setUserInfo(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let userInfo = realm.objects(UserModel.self).where({ $0.relation == "me" })
        if  userInfo.count == 1 {
            myName = userInfo[0].myName
            dominant = Dominant(rawValue: userInfo[0].dominant)!
            gender = Gender(rawValue: userInfo[0].gender)!
        }
    }
    func showRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(UserModel.self)
        print(results)
    }
    func deleteRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(UserModel.self)
        try! realm.write {
            realm.delete(results)
        }
    }
}
