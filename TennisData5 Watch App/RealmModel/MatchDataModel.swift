import Foundation
import RealmSwift
class MatchDataModel: Object,ObjectKeyIdentifiable {
    @Persisted var matchId: String
    @Persisted var matchFormat: String
    @Persisted var gemeType: String
    @Persisted var inputMode: String
    @Persisted var teamAplayer1id: String
    @Persisted var teamAplayer2id: String
    @Persisted var teamBplayer1id: String
    @Persisted var teamBplayer2id: String
    @Persisted var getSetCount: Int
    @Persisted var lostSetCount: Int
    @Persisted var drowSetCount: Int
    @Persisted var matchStartDate: Date
    @Persisted var matchEndDate: Date
}
