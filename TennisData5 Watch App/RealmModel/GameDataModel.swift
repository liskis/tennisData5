import Foundation
import RealmSwift
class GameDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var gameId: String
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var servOrRet: String
    @Persisted var gamePosition: String
    @Persisted var getPoint:Int
    @Persisted var lostPoint:Int
    @Persisted var gameStartDate: Date
    @Persisted var gameEndDate: Date
}
