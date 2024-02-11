import Foundation
import RealmSwift
class SetDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var getGameCount:Int
    @Persisted var lostGameCount:Int
    @Persisted var drowGameCount:Int
    @Persisted var setStartDate: Date
    @Persisted var setEndDate: Date
}
