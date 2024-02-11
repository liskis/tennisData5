import RealmSwift
class UserModel: Object,ObjectKeyIdentifiable {
    @Persisted var id: String
    @Persisted var myName: String
    @Persisted var dominant: String
    @Persisted var gender: String
    @Persisted var relation: String
    @Persisted var created: Date
    @Persisted var modified: Date
}
