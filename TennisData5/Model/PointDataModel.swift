import RealmSwift
class PointDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var id: String
    @Persisted var matchId: String
    @Persisted var setId: String
    @Persisted var gameId: String
    @Persisted var inputMode: String
    @Persisted var matchFormat: String
    @Persisted var gemeType: String
    @Persisted var player1id: String
    @Persisted var player2id: String
    @Persisted var player3id: String
    @Persisted var player4id: String
    @Persisted var servOrRet: String
    @Persisted var player1position: String
    @Persisted var player2position: String
    @Persisted var player3position: String
    @Persisted var player4position: String
    @Persisted var server: String
    @Persisted var service: String
    @Persisted var getPoint: String
    @Persisted var shot: String
    @Persisted var whose: String
    @Persisted var matchStartDate: Date
}

