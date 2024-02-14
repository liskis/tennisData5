import RealmSwift
import SwiftUI
import WatchConnectivity
class DataManageViewModel: NSObject, ObservableObject {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        return realm
    }
    func resetAllVM(){
        pointVM.returnInitialValue()
        matchInfoVM.returnInitialValue()
        positionVM.returnInitialValue()
        chartDataVM.returnInitialValue()
    }
    func matchRecoad(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
    }
    func setRecoad(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
    }
    func gameRecoad(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
    }
    func pointRecoad(){
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
//        let realm = try! Realm()
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
            setChartData()
        }
    }
    func setChartData(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self).where({ $0.matchId == matchInfoVM.matchId })
        
        // firstServeIn
        let serverPoints = results.filter{ $0.myPosition == "server"}
        let firstInPoints = serverPoints.filter{ $0.service == "first"}
        if serverPoints.count == 0 {
            chartDataVM.firstSvIn = [
                .init(value: 0, color: .blue, category: "firstSvIn", index: 60),
                .init(value: 100, color: .tungsten, category: "firstSvIn", index: 60)
            ]
        } else {
            let firstSvInRate = (Float(firstInPoints.count) / Float(serverPoints.count))*100
            let fiestSvInRateRound = round(firstSvInRate * 10) / 10
            chartDataVM.firstSvIn = [
                .init(value: fiestSvInRateRound, color: .blue, category: "firstSvIn", index: 60),
                .init(value: 100 - fiestSvInRateRound, color: .tungsten, category: "firstSvIn", index: 60)
            ]
            chartDataVM.firstSvInCount = "\(firstInPoints.count)/\(serverPoints.count)"
        }
        // secondSvIn
        let secondSvPoints = serverPoints.filter{
            $0.service == "second"
        }
        var doubleFaultCount: Int = 0
        if secondSvPoints.count == 0 {
            chartDataVM.secondSvIn = [
                .init(value: 0, color: .blue, category: "secondSvIn", index: 80),
                .init(value: 100, color: .tungsten, category: "secondSvIn", index: 80)
            ]
        } else {
            let doubleFaultPoints = secondSvPoints.filter{
                $0.whichPoint == "opponent"
                && $0.shot == "serve"
            }
            doubleFaultCount = doubleFaultPoints.count
            let secondSvInCount = secondSvPoints.count - doubleFaultCount
            let secondSvInRate = ( Float(secondSvInCount) / Float(secondSvPoints.count) ) * 100
            let secondSvInRateRound = round(secondSvInRate * 10) / 10
            chartDataVM.secondSvIn = [
                .init(value: secondSvInRateRound, color: .blue, category: "secondSvIn", index: 80),
                .init(value: 100 - secondSvInRateRound, color: .tungsten, category: "secondSvIn", index: 80)
            ]
            chartDataVM.secondSvInCount = "\(secondSvInCount)/\(secondSvPoints.count)"
        }
        // doubleFault
        if serverPoints.count == 0 {
            chartDataVM.doubleFault = [
                .init(value: 0, color: .blue, category: "doubleFault", index: 8),
                .init(value: 100, color: .tungsten, category: "doubleFault", index: 8)
            ]
        } else {
            let doubleFaultRate = ( Float(doubleFaultCount) / Float(serverPoints.count) ) * 100
            let doubleFaultRateRound = round(doubleFaultRate * 10) / 10
            chartDataVM.doubleFault = [
                .init(value: doubleFaultRateRound, color: .blue, category: "doubleFault", index: 8),
                .init(value: 100 - doubleFaultRateRound, color: .tungsten, category: "doubleFault", index: 8)
            ]
            chartDataVM.doubleFaultCount = "\(doubleFaultCount)/\(serverPoints.count)"
        }
        // noDoubleFault
        let noDoubleFaultCount = serverPoints.count - doubleFaultCount
        if serverPoints.count == 0 {
            chartDataVM.noDoubleFault = [
                .init(value: 0, color: .blue, category: "noDoubleFault", index: 92),
                .init(value: 100, color: .tungsten, category: "noDoubleFault", index: 92)
            ]
        } else {
            let noDoubleFaultRate = ( Float(noDoubleFaultCount) / Float(serverPoints.count) ) * 100
            let noDoubleFaultRateRound = round(noDoubleFaultRate * 10) / 10
            chartDataVM.noDoubleFault = [
                .init(value: noDoubleFaultRateRound, color: .blue, category: "noDoubleFault", index: 92),
                .init(value: 100 - noDoubleFaultRateRound, color: .tungsten, category: "noDoubleFault", index: 92)
            ]
            chartDataVM.noDoubleFaultCount = "\(noDoubleFaultCount)/\(serverPoints.count)"
        }
        // atFirstSv
        let atFirstGet = firstInPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if firstInPoints.count == 0 {
            chartDataVM.atFirstSv = [
                .init(value: 0, color: .blue, category: "atFirstSv", index: 60),
                .init(value: 100, color: .tungsten, category: "atFirstSv", index: 60)
            ]
        } else {
            let atFirstRate = ( Float(atFirstGet.count) / Float(firstInPoints.count) ) * 100
            let atFirstRateRound = round(atFirstRate * 10) / 10
            chartDataVM.atFirstSv = [
                .init(value: atFirstRateRound, color: .blue, category: "atFirstSv", index: 60),
                .init(value: 100 - atFirstRateRound, color: .tungsten, category: "atFirstSv", index: 60)
            ]
            chartDataVM.atFirstSvCount = "\(atFirstGet.count)/\(firstInPoints.count)"
        }
        // atSecondSv
        let atSecondGet = secondSvPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if secondSvPoints.count == 0 {
            chartDataVM.atSecondSv = [
                .init(value: 0, color: .blue, category: "atSecondSv", index: 50),
                .init(value: 100, color: .tungsten, category: "atSecondSv", index: 50)
            ]
        } else {
            let atSecondRate = ( Float(atSecondGet.count) / Float(secondSvPoints.count) ) * 100
            let atSecondRateRound = round(atSecondRate * 10) / 10
            chartDataVM.atSecondSv = [
                .init(value: atSecondRateRound, color: .blue, category: "atSecondSv", index: 50),
                .init(value: 100 - atSecondRateRound, color: .tungsten, category: "atSecondSv", index: 50)
            ]
            chartDataVM.atSecondSvCount = "\(atSecondGet.count)/\(secondSvPoints.count)"
        }
        // pieChart
        // getAndLostPoint
        if pointVM.allPoint + pointVM.allgameCount == 0 {
            chartDataVM.getAndLostPoint = [
                .init(name: "data1", nameString: "とった\nポイント", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "とられた\nポイント", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            let getPoints = results.filter{
                $0.whichPoint == "myTeam"
            }
            let lostPoints = results.filter{
                $0.whichPoint == "opponent"
            }
            chartDataVM.getAndLostPoint = [
                .init(name: "data1", nameString: "とった\nポイント", value: Double(getPoints.count), labelType: .twoLabels),
                .init(name: "data2", nameString: "とられた\nポイント", value: Double(lostPoints.count), labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: Double(getPoints.count + lostPoints.count), labelType: .twoLabels)
            ]
        }
        // pointRateBySvOrVoly
        let serviceGamePoints = results.filter{
            $0.servOrRet == "serviceGame"
        }
        if serviceGamePoints.count == 0 {
            chartDataVM.pointRateBySvOrVoly = [
                .init(name: "data1", nameString: "サーバー", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            var serverGetRate: Double = 0
            var volleyerAtSvGetRate: Double = 0
            if serverPoints.count != 0 {
                let getServerPoints = serverPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                serverGetRate = round( ( Double(getServerPoints.count) / Double(serverPoints.count) ) * 1000 ) / 10
            }
            let volleyerAtSvPoints = results.filter{
                $0.servOrRet == "serviceGame"
                && $0.myPosition == "volleyer"
            }
            if volleyerAtSvPoints.count != 0 {
                let getVolleyerAtSvPoints = volleyerAtSvPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                volleyerAtSvGetRate = round( ( Double(getVolleyerAtSvPoints.count) / Double(volleyerAtSvPoints.count) ) * 1000 ) / 10
            }
            chartDataVM.pointRateBySvOrVoly = [
                .init(name: "data1", nameString: "サーバー", value: serverGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "ボレーヤー", value: volleyerAtSvGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: serverGetRate + volleyerAtSvGetRate, labelType: .twoLabels)
            ]
        }
        // pointRateByRetOrVoly
        let returnGamePoints = results.filter{
            $0.servOrRet == "returnGame"
        }
        if returnGamePoints.count == 0 {
            chartDataVM.pointRateByRetOrVoly = [
                .init(name: "data1", nameString: "リターナー", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            var returnerGetRate: Double = 0
            var volleyerAtRetGetRate: Double = 0
            let returnerPoints = results.filter{
                $0.myPosition == "returner"
            }
            if returnerPoints.count != 0 {
                let getReturnerPoints = returnerPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                returnerGetRate = round( ( Double(getReturnerPoints.count) / Double(returnerPoints.count) ) * 1000 ) / 10
            }
            let volleyerAtRetPoints = results.filter{
                $0.servOrRet == "returngame"
                && $0.myPosition == "volleyer"
            }
            if volleyerAtRetPoints.count != 0 {
                let getVolleyerAtRetPoints = volleyerAtRetPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                volleyerAtRetGetRate = round( ( Double(getVolleyerAtRetPoints.count) / Double(volleyerAtRetPoints.count) ) * 1000 ) / 10
            }
            chartDataVM.pointRateByRetOrVoly = [
                .init(name: "data1", nameString: "リターナー", value: returnerGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "ボレーヤー", value: volleyerAtRetGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: returnerGetRate + volleyerAtRetGetRate, labelType: .twoLabels)
            ]
        }
        
        // pointRateByServiceSide
        if serviceGamePoints.count == 0 {
            chartDataVM.pointRateByServiceSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            var duceGetRate: Double = 0
            var advGetRate: Double = 0
            
            let ducePoints = serviceGamePoints.filter{
                $0.side == "duceSide"
            }
            if ducePoints.count != 0 {
                let getDucePoints = ducePoints.filter{
                    $0.whichPoint == "myTeam"
                }
                duceGetRate = round( ( Double(getDucePoints.count) / Double(ducePoints.count) ) * 1000 ) / 10
            }
            
            let advPoints = serviceGamePoints.filter{
                $0.side == "advantageSide"
            }
            if advPoints.count != 0 {
                let getAdvPoints = advPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                advGetRate = round( ( Double(getAdvPoints.count) / Double(advPoints.count) ) * 1000 ) / 10
            }
            chartDataVM.pointRateByServiceSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: duceGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: advGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: duceGetRate + advGetRate, labelType: .twoLabels)
            ]
        }
        // pointRateByReturnSide
        
        if returnGamePoints.count == 0 {
            chartDataVM.pointRateByReturnSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            var duceGetRate: Double = 0
            var advGetRate: Double = 0
            
            let ducePoints = returnGamePoints.filter{
                ( $0.side == "duceSide" && $0.myPosition == "returner" )
                || ( $0.side == "advantageSide" && $0.myPosition == "volleyer")
            }
            if ducePoints.count != 0 {
                let getDucePoints = ducePoints.filter{
                    $0.whichPoint == "myTeam"
                }
                duceGetRate = round( ( Double(getDucePoints.count) / Double(ducePoints.count) ) * 1000 ) / 10
            }
            
            let advPoints = returnGamePoints.filter{
                ( $0.side == "duceSide" && $0.myPosition == "volleyer" )
                || ( $0.side == "advantageSide" && $0.myPosition == "returner")
            }
            if advPoints.count != 0 {
                let getAdvPoints = advPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                advGetRate = round( ( Double(getAdvPoints.count) / Double(advPoints.count) ) * 1000 ) / 10
            }
            chartDataVM.pointRateByReturnSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: duceGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: advGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: duceGetRate + advGetRate, labelType: .twoLabels)
            ]
        }
    }
    
    func setGameChart(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let games = realm.objects(GameDataModel.self).where({
            $0.matchId == matchInfoVM.matchId
            && $0.getPoint != $0.lostPoint
        })
        if games.count == 0 {
            chartDataVM.keepAndBreak = [
                .init(name: "data1", nameString: "キープ率", value: 1, labelType: .twoLabels),
                .init(name: "data2", nameString: "ブレーク率", value: 1, labelType: .twoLabels),
                .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
            ]
        } else {
            // keepAndBreakPoint
            var keepRate: Double = 0
            var breakRate: Double = 0
            let serviceGames = games.filter{
                $0.servOrRet == "serviceGame"
            }
            if serviceGames.count != 0 {
                let keepGames = serviceGames.filter{ $0.getPoint > $0.lostPoint}
                keepRate = round((Double(keepGames.count)/Double(serviceGames.count)) * 1000) / 10
            }
            let returnGames = games.filter{
                $0.servOrRet == "returnGame"
            }
            if returnGames.count != 0 {
                let breakGames = returnGames.filter{ $0.getPoint > $0.lostPoint}
                breakRate = round((Double(breakGames.count)/Double(returnGames.count)) * 1000) / 10
            }
            if keepRate + breakRate >= 100 {
                chartDataVM.keepAndBreak = [
                    .init(name: "data1", nameString: "キープ率", value: keepRate, labelType: .twoLabels),
                    .init(name: "data2", nameString: "ブレーク率", value: breakRate, labelType: .twoLabels),
                    .init(name: "blank", nameString: "", value: keepRate + breakRate, labelType: .twoLabels)
                ]
                chartDataVM.keepAndBreakStyleScale = [
                    "data1": .blue, "data2": .aqua, "blank": .black
                ]
            } else {
                chartDataVM.keepAndBreak = [
                    .init(name: "data1", nameString: "キープ率", value: keepRate, labelType: .twoLabels),
                    .init(name: "data2", nameString: "ブレーク率", value: breakRate, labelType: .twoLabels),
                    .init(name: "data3", nameString: "あと", value: 100 - keepRate - breakRate, labelType: .twoLabels),
                    .init(name: "blank", nameString: "", value: 100, labelType: .twoLabels)
                ]
                chartDataVM.keepAndBreakStyleScale = [
                    "data1": .blue, "data2": .aqua, "data3": .red, "blank": .black
                ]
            }
        }
    }
    
    func goBack(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
        setChartData()
        setGameChart()
    }
    func showPointRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(PointDataModel.self)
        print(results)
    }
    func showGameRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(GameDataModel.self)
        print(results)
    }
    func showSetRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(SetDataModel.self)
        print(results)
    }
    func showMatchRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let results = realm.objects(MatchDataModel.self)
        print(results)
    }
    func deleteRealm(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
    
    
    
    // データを受信したときに呼ばれるメソッド
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            // Watchアプリからデータを受信したときに呼ばれるメソッド
            // 受信したデータを処理するコードをここに追加
            if let pointData = message["pointData"] as? Data {
                print("Received pointData: \(pointData)")
                // デコード処理
                if let decodedData = try? JSONDecoder().decode(PointDataModel.self, from: pointData) {
                    self.realm.add(decodedData)
                    self.setChartData()
                    self.pointVM.getPoint = decodedData.getPoint
                    self.pointVM.lostPoint = decodedData.lostPoint
                    self.pointVM.getGameCount = decodedData.getGameCount
                    self.pointVM.drowGameCount = decodedData.drowGameCount
                    if decodedData.servOrRet == "returnGame" && decodedData.myPosition == "volleyer" {
                        self.positionVM.myPosition = .returner
                    } else if decodedData.servOrRet == "returnGame" && decodedData.myPosition == "returner" {
                        self.positionVM.myPosition = .volleyer
                    }
                    if decodedData.side == "duceSide" {
                        self.positionVM.side = .advantageSide
                    } else if decodedData.side == "advantageSide" {
                        self.positionVM.side = .duceSide
                    }
                }
            }
        }
    }
    
    // 通信を行うメソッド
    func sendPointData(pointData:PointDataModel){
        // watchと接続ができていない場合は早期リターン
        guard session.activationState == .activated else {
            print("セッションがアクティブではないので送信できません")
            return
        }
        let encodedData = try! JSONEncoder().encode(pointData)
        let message = ["pointData": encodedData]
        WCSession.default.sendMessage(message, replyHandler: nil, errorHandler: { error in
            print("Error sending message: \(error.localizedDescription)")
        })
    }
}
