import RealmSwift
class PointDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var id: String
    @Persisted var matchId: String
    @Persisted var setId: String
    @Persisted var gameId: String
    @Persisted var matchStartDate: Date
    @Persisted var matchFormat: String
    @Persisted var gemeType: String
    @Persisted var inputMode: String
    @Persisted var teamAplayer1id: String
    @Persisted var teamAplayer2id: String
    @Persisted var teamBplayer1id: String
    @Persisted var teamBplayer2id: String
    @Persisted var servOrRet: String
    @Persisted var side: String
    @Persisted var myPosition: String
    @Persisted var teamAplayer1position: String
    @Persisted var teamAplayer2position: String
    @Persisted var teamBplayer1position: String
    @Persisted var teamBplayer2position: String
    @Persisted var server: String
    @Persisted var winCount:Int
    @Persisted var loseCount:Int
    @Persisted var drowCount:Int
    @Persisted var myPoint:Int
    @Persisted var opponentPoint:Int
    @Persisted var service: String
    @Persisted var getPoint: String
    @Persisted var shot: String
    @Persisted var whose: String
    @Persisted var tactics: String
    @Persisted var matchEnd: String
    @Persisted var matchEndDate: Date
}
