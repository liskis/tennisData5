import RealmSwift
class PointDataModel: Object {
    @objc dynamic var id: String
    @objc dynamic var matchId: String
    @objc dynamic var setId: String
    @objc dynamic var gameId: String
    @objc dynamic var inputMode: String
    @objc dynamic var matchFormat: String
    @objc dynamic var gemeType: String
    @objc dynamic var player1id: String
    @objc dynamic var player2id: String
    @objc dynamic var player3id: String
    @objc dynamic var player4id: String
    @objc dynamic var servOrRet: String
    @objc dynamic var player1position: String
    @objc dynamic var player2position: String
    @objc dynamic var player3position: String
    @objc dynamic var player4position: String
    @objc dynamic var server: String
    @objc dynamic var service: String
    @objc dynamic var getPoint: String
    @objc dynamic var shot: String
    @objc dynamic var whose: String
    @objc dynamic var matchStartDate: String
    init(
        id: String,
        matchId: String,
        setId: String,
        gameId: String,
        inputMode: String,
        matchFormat: String,
        gemeType: String,
        player1id: String,
        player2id: String,
        player3id: String,
        player4id: String,
        servOrRet: String,
        player1position: String,
        player2position: String,
        player3position: String,
        player4position: String,
        server: String,
        service: String,
        getPoint: String,
        shot: String,
        whose: String,
        matchStartDate: String
    ){
        self.id = id
        self.matchId = matchId
        self.setId = setId
        self.gameId = gameId
        self.inputMode = inputMode
        self.matchFormat = matchFormat
        self.gemeType = gemeType
        self.player1id = player1id
        self.player2id = player2id
        self.player3id = player3id
        self.player4id = player4id
        self.servOrRet = servOrRet
        self.player1position = player1position
        self.player2position = player2position
        self.player3position = player3position
        self.player4position = player4position
        self.server = server
        self.service = service
        self.getPoint = getPoint
        self.shot = shot
        self.whose = whose
        self.matchStartDate = matchStartDate
    }
}

