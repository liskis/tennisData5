import RealmSwift
import SwiftUI
import WatchConnectivity
class DataManageViewModel: NSObject, ObservableObject {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var homeVM = HomeViewModel()
   
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    func resetAllVM(){
        pointVM.returnInitialValue()
        matchInfoVM.returnInitialValue()
        positionVM.returnInitialValue()
        chartDataVM.returnInitialValue()
    }
    
    func matchRecoad() -> MatchDataModel{
        let matchData = MatchDataModel()
        try! realm.write{
            matchData.matchId = matchInfoVM.matchId
            matchData.matchFormat = matchInfoVM.matchFormat.rawValue
            matchData.gemeType = matchInfoVM.gameType.rawValue
            matchData.inputMode = matchInfoVM.inputMode.rawValue
            matchData.teamAplayer1id = matchInfoVM.teamAplayer1id
            matchData.teamAplayer2id = matchInfoVM.teamAplayer2id
            matchData.teamBplayer1id = matchInfoVM.teamBplayer1id
            matchData.teamBplayer2id = matchInfoVM.teamBplayer2id
            matchData.getSetCount = pointVM.getSetCount
            matchData.lostSetCount = pointVM.lostSetCount
            matchData.drowSetCount = pointVM.drowSetCount
            matchData.matchStartDate = matchInfoVM.matchStartDate
            matchData.matchEndDate = Date()
            realm.add(matchData)
        }
        return matchData
    }
    func setRecoad() -> SetDataModel{
        let setData = SetDataModel()
        try! realm.write{
            setData.setId = matchInfoVM.setId
            setData.matchId = matchInfoVM.matchId
            setData.getGameCount = pointVM.getGameCount
            setData.lostGameCount = pointVM.lostGameCount
            setData.drowGameCount = pointVM.drowGameCount
            setData.setStartDate = matchInfoVM.setStartDate
            setData.setEndDate = Date()
            realm.add(setData)
        }
        return setData
    }
    func gameRecoad() -> GameDataModel{
        let gameData = GameDataModel()
        try! realm.write{
            gameData.gameId = matchInfoVM.gameId
            gameData.setId = matchInfoVM.setId
            gameData.matchId = matchInfoVM.matchId
            gameData.servOrRet = positionVM.servOrRet.rawValue
            gameData.gamePosition = positionVM.gamePosition.rawValue
            gameData.getPoint = pointVM.getPoint
            gameData.lostPoint = pointVM.lostPoint
            gameData.gameStartDate = matchInfoVM.gameStartDate
            gameData.gameEndDate = Date()
            realm.add(gameData)
        }
        return gameData
    }
    
    func pointRecoad() -> PointDataModel{
        let pointData = PointDataModel()
        try! realm.write{
            pointData.pointId = UUID().uuidString
            pointData.gameId = matchInfoVM.gameId
            pointData.setId = matchInfoVM.setId
            pointData.matchId = matchInfoVM.matchId
            pointData.servOrRet = positionVM.servOrRet.rawValue
            pointData.side = positionVM.side.rawValue
            pointData.myPosition = positionVM.myPosition.rawValue
            pointData.server = positionVM.server.rawValue
            pointData.getGameCount = pointVM.getGameCount
            pointData.lostGameCount = pointVM.lostGameCount
            pointData.drowGameCount = pointVM.drowGameCount
            pointData.getPoint = pointVM.getPoint
            pointData.lostPoint = pointVM.lostPoint
            pointData.service = pointVM.service.rawValue
            pointData.whichPoint = pointVM.whichPoint.rawValue
            pointData.shot = pointVM.shot.rawValue
            pointData.whose = pointVM.whose.rawValue
            pointData.tactics = pointVM.tactics.rawValue
            pointData.dateTime = Date()
            realm.add(pointData)
            chartDataVM.setChartData(matchId: matchInfoVM.matchId, allCount: pointVM.allCount)
        }
        return pointData
    }
    func goBack(){
        if pointVM.allCount == 0 && positionVM.servOrRet == .noSelection {
            homeVM.toPointGameView = false
        } else {
            if pointVM.service == .second {
                pointVM.service = .first
            } else if positionVM.myPosition != .noSelection {
                positionVM.myPosition = .noSelection
            } else if positionVM.servOrRet != .noSelection && pointVM.allPoint == 0 {
                positionVM.servOrRet = .noSelection
            } else {
                let pointData = realm.objects(PointDataModel.self).where({ $0.matchId == matchInfoVM.matchId })
                if pointData.count != 0 && pointVM.allPoint + pointVM.allgameCount != 0 {
                    positionVM.myPosition = Position(rawValue: pointData.last!.myPosition)!
                    positionVM.servOrRet = ServOrRet(rawValue: pointData.last!.servOrRet)!
                    positionVM.side = Side(rawValue: pointData.last!.side)!
                    pointVM.service = Service(rawValue: pointData.last!.service)!
                    if pointVM.allPoint == 1 {
                        pointVM.getPoint = 0
                        pointVM.lostPoint = 0
                        if let lastPoint = pointData.last {
                            try! realm.write() {
                                realm.delete(lastPoint)
                            }
                        }
                    } else if pointVM.allPoint == 0 {
                        positionVM.myPosition = .noSelection
                        positionVM.servOrRet = ServOrRet(rawValue: pointData.last!.servOrRet)!
                        positionVM.side = .noSelection
                        pointVM.service = .first
                        pointVM.getGameCount = pointData.last!.getGameCount
                        pointVM.lostGameCount = pointData.last!.lostGameCount
                        pointVM.drowGameCount = pointData.last!.drowGameCount
                        pointVM.getPoint = pointData.last!.getPoint
                        pointVM.lostPoint = pointData.last!.lostPoint
                        matchInfoVM.gameId = pointData.last!.gameId
                        let games = realm.objects(GameDataModel.self).where({
                            $0.matchId == matchInfoVM.matchId
                        })
                        if let lastGame = games.last {
                            try! realm.write() {
                                realm.delete(lastGame)
                            }
                        }
                    } else {
                        if let lastPoint = pointData.last {
                            try! realm.write() {
                                realm.delete(lastPoint)
                            }
                        }
                        let results = realm.objects(PointDataModel.self).where({
                            $0.matchId == matchInfoVM.matchId
                        })
                        pointVM.getGameCount = results.last!.getGameCount
                        pointVM.lostGameCount = results.last!.lostGameCount
                        pointVM.drowGameCount = results.last!.drowGameCount
                        pointVM.getPoint = results.last!.getPoint
                        pointVM.lostPoint = results.last!.lostPoint
                        matchInfoVM.gameId = results.last!.gameId
                    }
                }
                chartDataVM.setChartData(matchId: matchInfoVM.matchId, allCount: pointVM.allCount)
                chartDataVM.setGameChart(matchId: matchInfoVM.matchId)
            }
        }
    }
    func nextGame(){
        if pointVM.getPoint > pointVM.lostPoint {
            pointVM.getGameCount += 1
        } else if pointVM.getPoint < pointVM.lostPoint {
            pointVM.lostGameCount += 1
        } else if pointVM.getPoint == pointVM.lostPoint {
            pointVM.drowGameCount += 1
        }
        let gameData = gameRecoad()
        let newGameId = UUID().uuidString
        Task{
            await WCNextGame(
                gameData: gameData,
                newGameId: newGameId
            )
        }
        chartDataVM.setGameChart(matchId: matchInfoVM.matchId)
        pointVM.service = .first
        positionVM.myPosition = .noSelection
        positionVM.servOrRet = .noSelection
        pointVM.getPoint = 0
        pointVM.lostPoint = 0
        matchInfoVM.gameId = newGameId
    }
    func gameEnd(){
        let setData = setRecoad()
        let matchData = matchRecoad()
        Task{
            await WCGameEnd(matchData: matchData, setData: setData)
        }
        homeVM.setHomeData()
        homeVM.toOneMatchDataView = true
    }
    func fault(){
        if positionVM.myPosition != .noSelection {
            pointVM.service = .second
        }
        Task {
            await WCSelectPositionAndService()
        }
    }
    func doubleFault(){
        if positionVM.servOrRet == .serviceGame {
            pointVM.whichPoint = .opponent
            pointVM.lostPoint += 1
        } else if positionVM.servOrRet == .returnGame {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
        }
        pointVM.shot = .serve
        let pointData = pointRecoad()
        Task {
            await WCGetAndLostPoint(pointData:pointData)
        }
        if positionVM.side == .advantageSide {
            positionVM.side = .duceSide
        } else if positionVM.side == .duceSide {
            positionVM.side = .advantageSide
        }
        
        if matchInfoVM.matchFormat == .doubles && positionVM.servOrRet == .returnGame {
            if positionVM.myPosition == .volleyer {
                positionVM.myPosition = .returner
            } else {
                positionVM.myPosition = .volleyer
            }
        }
        pointVM.service = .first
        pointVM.whichPoint = .noSelection
        pointVM.shot = .noSelection
    }
    func showPointRealm(){
        let results = realm.objects(PointDataModel.self)
        print(results)
    }
    func showGameRealm(){
        let results = realm.objects(GameDataModel.self)
        print(results)
    }
    func showSetRealm(){
        let results = realm.objects(SetDataModel.self)
        print(results)
    }
    func showMatchRealm(){
        let results = realm.objects(MatchDataModel.self)
        print(results)
    }
    func deleteRealm(){
        let pointData = realm.objects(PointDataModel.self)
        try! realm.write {
            realm.delete(pointData)
        }
        let gameData = realm.objects(GameDataModel.self)
        try! realm.write {
            realm.delete(gameData)
        }
        let setData = realm.objects(SetDataModel.self)
        try! realm.write {
            realm.delete(setData)
        }
        let matchData = realm.objects(MatchDataModel.self)
        try! realm.write {
            realm.delete(matchData)
        }
        let userData = realm.objects(UserModel.self)
        try! realm.write {
            realm.delete(userData)
        }
    }
    
    private let session: WCSession
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        self.session.delegate = self
        self.session.activate()
    }
}

extension DataManageViewModel: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // WCSessionのアクティベーションが完了したときに呼ばれるメソッド
        // activationStateにはアクティベーションの状態が渡される
        // エラーがあればerrorに渡される
        // アクティベーションが完了した後に必要な初期化などを行う場合、このメソッド内で行うことができる
    }
    func sessionDidBecomeInactive(_ session: WCSession) {
        // WCSessionが非アクティブ状態になったときに呼ばれるメソッド
        // 通信が中断されるなどの状態変化に対処するための処理をここに追加することができる
    }

    func sessionDidDeactivate(_ session: WCSession) {
        // WCSessionが非アクティブ状態から再アクティブ化する前に呼ばれるメソッド
        // アクティベーションが失敗して非アクティブ状態になった場合、再アクティベーションを試みる処理がここに追加されることがある
        // WCSession.default.activate() などを呼び出して再アクティベートできる
    }
    // データを受信したときに呼ばれるメソッド
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            // Watchアプリからデータを受信したときに呼ばれるメソッド
            // 受信したデータを処理するコードをここに追加
            
            if let closeOneMatchData = message["closeOneMatchData"] as? Bool {
                print("Received closeOneMatchData")
                if closeOneMatchData {
                    self.resetAllVM()
                    self.homeVM.toPointGameView = false
                }
            }
            if let goBack = message["goBack"] as? Bool {
                print("Received goBack")
                if goBack {
                    self.goBack()
                }
            }
            if let gameEnd = message["gameEnd"] as? Data {
                print("Received gameEnd")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(GameEndWCModel.self, from: gameEnd) {
                    try! self.realm.write{
                        self.realm.add(decodedData.matchData)
                        self.realm.add(decodedData.setData)
                    }
                    self.homeVM.setHomeData()
                    self.homeVM.toOneMatchDataView = true
                }
            }
            if let matchInfo = message["toMatchView"] as? Data {
                print("Received toMatchView")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(MatchInfoViewModel.self, from: matchInfo) {
                    self.matchInfoVM = decodedData
                    withAnimation {
                        self.homeVM.toPointGameView = true
                    }
                }
            }
            if let selectPAS = message["selectPositionAndService"] as? Data {
                print("Received selectPositionAndService")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(PositionAndServiceWCModel.self, from: selectPAS) {
                    self.positionVM.servOrRet = decodedData.positionVM.servOrRet
                    self.positionVM.side = decodedData.positionVM.side
                    self.positionVM.myPosition = decodedData.positionVM.myPosition
                    self.positionVM.teamAplayer1position = decodedData.positionVM.teamAplayer1position
                    self.positionVM.teamAplayer2position = decodedData.positionVM.teamAplayer2position
                    self.positionVM.teamBplayer1position = decodedData.positionVM.teamBplayer1position
                    self.positionVM.teamBplayer2position = decodedData.positionVM.teamBplayer2position
                    self.positionVM.server = decodedData.positionVM.server
                    self.pointVM.service = decodedData.service
                }
            }
            if let nextGame = message["nextGame"] as? Data {
                print("Received nextGame")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(NextGameWCModel.self, from: nextGame) {
                    try! self.realm.write {
                        self.realm.add(decodedData.gameData)
                    }
                    if decodedData.gameData.getPoint > decodedData.gameData.lostPoint {
                        self.pointVM.getGameCount += 1
                    } else if decodedData.gameData.getPoint < decodedData.gameData.lostPoint {
                        self.pointVM.lostGameCount += 1
                    } else if decodedData.gameData.getPoint == decodedData.gameData.lostPoint {
                        self.pointVM.drowGameCount += 1
                    }
                    self.matchInfoVM.gameId = decodedData.newGameId
                    self.pointVM.getPoint = 0
                    self.pointVM.lostPoint = 0
                    self.pointVM.service = .first
                    self.positionVM.servOrRet = .noSelection
                    self.positionVM.myPosition = .noSelection
                    self.positionVM.server = .noSelection
                    self.positionVM.gamePosition = .noSelection
                    self.chartDataVM.setChartData(matchId: self.matchInfoVM.matchId, allCount: self.pointVM.allCount)
                    self.chartDataVM.setGameChart(matchId: self.matchInfoVM.matchId)
                }
            }
            if let pointData = message["pointData"] as? Data {
                print("Received pointData: \(pointData)")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(PointDataModel.self, from: pointData) {
                    try! self.realm.write {
                        self.realm.add(decodedData)
                    }
                    self.matchInfoVM.matchId = decodedData.matchId
                    self.matchInfoVM.setId = decodedData.setId
                    self.matchInfoVM.gameId = decodedData.gameId
                    self.pointVM.getPoint = decodedData.getPoint
                    self.pointVM.lostPoint = decodedData.lostPoint
                    self.pointVM.getGameCount = decodedData.getGameCount
                    self.pointVM.drowGameCount = decodedData.drowGameCount
                    if decodedData.servOrRet == "returnGame" && decodedData.myPosition == "volleyer" {
                        self.positionVM.myPosition = .returner
                    } else if decodedData.myPosition == "returner" {
                        self.positionVM.myPosition = .volleyer
                    } else if decodedData.myPosition == "server" {
                        self.positionVM.myPosition = .server
                    } else if decodedData.servOrRet == "serviceGame" && decodedData.myPosition == "volleyer" {
                        self.positionVM.myPosition = .volleyer
                    }
                    if decodedData.side == "duceSide" {
                        self.positionVM.side = .advantageSide
                    } else if decodedData.side == "advantageSide" {
                        self.positionVM.side = .duceSide
                    }
                    self.positionVM.servOrRet = ServOrRet(rawValue: decodedData.servOrRet)!
                    self.positionVM.server = Server(rawValue: decodedData.server)!
                    self.chartDataVM.setChartData(matchId: self.matchInfoVM.matchId, allCount: self.pointVM.allCount)
                }
            }
            if let noMyData = message["startApp-noMyData"] as? Bool {
                print("Received startApp-noMyData")
                if noMyData {
                    self.WCStartAppReturn()
                }
            }
            if let myData = message["startApp-myData"] as? Data {
                print("Received startApp-myData")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(UserModel.self, from: myData) {
                    self.overWriteMyData(myData: decodedData)
                }
                self.WCStartAppReturn()
                
            }
            if let myData = message["WCStartAppReturn-myData"] as? Data {
                print("Received WCStartAppReturn-myData")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(UserModel.self, from: myData) {
                    self.overWriteMyData(myData: decodedData)
                }
            }
        }
    }
    
    // 通信を行うメソッド
    
    func WCCloseOneMatchData() async{
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task{
            let message = ["closeOneMatchData": true]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func WCGoBack() async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task{
            let message = ["goBack": true]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    
    func WCToMatchView() async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task {
            let encodedData = try! JSONEncoder().encode(self.matchInfoVM)
            let message = ["toMatchView": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func WCGameEnd(matchData: MatchDataModel, setData: SetDataModel) async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task {
            let gameEnd = GameEndWCModel()
            gameEnd.matchData = matchData
            gameEnd.setData = setData
            let encodedData = try! JSONEncoder().encode(gameEnd)
            let message = ["gameEnd": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    
    func WCSelectPositionAndService() async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task {
            let selectPAS = PositionAndServiceWCModel()
            selectPAS.positionVM = self.positionVM
            selectPAS.service = self.pointVM.service
            let encodedData = try! JSONEncoder().encode(selectPAS)
            let message = ["selectPositionAndService": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func WCNextGame(gameData:GameDataModel,newGameId:String) async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task {
            let nextGame = NextGameWCModel()
            nextGame.gameData = gameData
            nextGame.newGameId = newGameId
            let encodedData = try! JSONEncoder().encode(nextGame)
            let message = ["nextGame": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func WCGetAndLostPoint(pointData:PointDataModel) async {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        Task {
            let encodedData = try! JSONEncoder().encode(pointData)
            let message = ["pointData": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    func WCStartApp() {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        let myData = self.realm.objects(UserModel.self).where({ $0.relation == "me" })
        if myData.isEmpty == false {
            let encodedData = try! JSONEncoder().encode(myData.first)
            let message = ["startApp-myData": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        } else {
            let message = ["startApp-noMyData": true]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
        
    }
    func WCStartAppReturn() {
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        let myData = self.realm.objects(UserModel.self).where({ $0.relation == "me" })
        if myData.isEmpty == false {
            let encodedData = try! JSONEncoder().encode(myData.first)
            let message = ["WCStartAppReturn-myData": encodedData]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
        
    }
    func overWriteMyData(myData: UserModel){
        let thisMyData = self.realm.objects(UserModel.self).where({ $0.relation == "me" })
        if thisMyData.isEmpty {
            try! self.realm.write {
                self.realm.add(myData)
            }
        } else if thisMyData.first!.modified < myData.modified {
            try! realm.write{
                thisMyData.first!.myName = myData.myName
                thisMyData.first!.dominant = myData.dominant
                thisMyData.first!.gender = myData.gender
                thisMyData.first!.created = myData.created
                thisMyData.first!.modified = myData.modified
            }
        }
        
    }
}
