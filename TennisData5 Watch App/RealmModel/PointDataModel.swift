import RealmSwift
class PointDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var pointId: String
    @Persisted var gameId: String
    @Persisted var setId: String
    @Persisted var matchId: String
    @Persisted var servOrRet: String
    @Persisted var side: String
    @Persisted var myPosition: String
    @Persisted var server: String
    @Persisted var getGameCount:Int
    @Persisted var lostGameCount:Int
    @Persisted var drowGameCount:Int
    @Persisted var getPoint:Int
    @Persisted var lostPoint:Int
    @Persisted var service: String
    @Persisted var whichPoint: String
    @Persisted var shot: String
    @Persisted var whose: String
    @Persisted var tactics: String
    @Persisted var dateTime: Date
}
