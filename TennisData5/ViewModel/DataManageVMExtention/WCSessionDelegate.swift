
import RealmSwift
import SwiftUI
import WatchConnectivity

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
            
            // マッチデータ確認画面を閉じる
            if let closeOneMatchData = message["closeOneMatchData"] as? Bool {
                print("Received closeOneMatchData")
                if closeOneMatchData {
                    self.resetAllVM()
                    self.homeVM.toPointGameView = false
                }
            }
            
            // 戻るボタンを押す
            if let goBack = message["goBack"] as? Bool {
                print("Received goBack")
                if goBack {
                    self.goBack()
                }
            }
            
            // 自分の情報を更新する
            if let myData = message["updateUserInfo"] as? Data {
                print("Received updateUserInfo")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(UserModel.self, from: myData) {
                    self.userVM.myName = decodedData.myName
                    self.userVM.dominant = Dominant(rawValue: decodedData.dominant)!
                    self.userVM.gender = Gender(rawValue: decodedData.gender)!
                }
                self.userVM.updateUserInfo()
            }
            
            // 試合終了の処理
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
            
            // マッチビューへ遷移
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
            
            // ポジションとサーブの変更
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
            
            // 次のゲームへ
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
            
            // ポイントデータを保存する
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
            
            // まだ自分の名前を登録していない時の処理
            if let noMyData = message["startApp-noMyData"] as? Bool {
                print("Received startApp-noMyData")
                if noMyData {
                    Task{
                        await self.WCStartAppReturn()
                    }
                }
            }
            
            // 自分のデータを更新して返す
            if let myData = message["startApp-myData"] as? Data {
                print("Received startApp-myData")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(UserModel.self, from: myData) {
                    Task{
                        await self.overWriteMyData(myData: decodedData)
                    }
                }
                Task{
                    await self.WCStartAppReturn()
                }
                
            }
            
            // お互いに自分のデータがなかった時
            if let noMyData = message["WCStartAppReturn-noMyData"] as? Bool {
                print("Received WCStartAppReturn-noMyData")
                if noMyData {
                    Task{
                        self.userVM.setUserInfo()
                    }
                }
            }
            
            // 自分のデータを更新する
            if let myData = message["WCStartAppReturn-myData"] as? Data {
                print("Received WCStartAppReturn-myData")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(UserModel.self, from: myData) {
                    Task{
                        await self.overWriteMyData(myData: decodedData)
                        self.userVM.setUserInfo()
                    }
                }
            }
        }
    }
    
    // 送信を行うメソッド
    
    // データ確認画面を閉じた情報を送信
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
    
    // 戻るボタンを押した情報を送る
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
    
    // マッチビューに遷移するための情報を送る
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
    
    // 試合終了の情報を送る
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
    
    // ポジションとサービスの変更情報を送る
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
    
    // 次のゲームの情報を送る
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
    
    // ポイントデータを送る
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
    
    // アプリを立ち上げたときにユーザー情報を同期する
    func WCStartApp() async {
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
    
    // 立ち上げた時にユーザーデータを返す
    func WCStartAppReturn() async {
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
        } else {
            let message = ["WCStartAppReturn-noMyData": true]
            WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
                print("Error sending message: \(error.localizedDescription)")
            })
        }
    }
    
    // 自分の情報を更新する
    func WCUpdateUserInfo() async {
        let myData = self.realm.objects(UserModel.self).where({ $0.relation == "me" }).first
        let encodedData = try! JSONEncoder().encode(myData)
        let message = ["updateUserInfo": encodedData]
        WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
            print("Error sending message: \(error.localizedDescription)")
        })
    }
    
    // 自分の情報を上書きする
    func overWriteMyData(myData: UserModel) async {
        let thisMyData = self.realm.objects(UserModel.self).where({ $0.relation == "me" })
        if thisMyData.isEmpty {
            try! self.realm.write {
                realm.add(myData)
            }
        } else if thisMyData.first!.modified < myData.modified {
            try! self.realm.write{
                thisMyData.first!.myName = myData.myName
                thisMyData.first!.dominant = myData.dominant
                thisMyData.first!.gender = myData.gender
                thisMyData.first!.created = myData.created
                thisMyData.first!.modified = myData.modified
            }
        }
    }
}

