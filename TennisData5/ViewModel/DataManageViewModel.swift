import RealmSwift
import SwiftUI
class DataManageViewModel: ObservableObject {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    
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
        showGameRealm()
    }
    
    func pointRecoad(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
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
        showPointRealm()
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
                .init(value: 0, color: .ocean, category: "firstSvIn", index: 60),
                .init(value: 100, color: .mercury, category: "firstSvIn", index: 60)
            ]
        } else {
            let firstSvInRate = (Float(firstInPoints.count) / Float(serverPoints.count))*100
            let fiestSvInRateRound = round(firstSvInRate * 10) / 10
            chartDataVM.firstSvIn = []
            chartDataVM.firstSvIn.append(BarChartDataModel(value: fiestSvInRateRound, color: .ocean, category: "firstSvIn", index: 60))
            chartDataVM.firstSvIn.append(BarChartDataModel(value: 100 - fiestSvInRateRound, color: .mercury, category: "firstSvIn", index: 60))
            chartDataVM.firstSvInCount = "\(firstInPoints.count)/\(serverPoints.count)"
        }
        // secondSvIn
        let secondSvPoints = serverPoints.filter{
            $0.service == "second"
        }
        var doubleFaultCount: Int = 0
        if secondSvPoints.count == 0 {
            chartDataVM.secondSvIn = [
                .init(value: 0, color: .ocean, category: "secondSvIn", index: 80),
                .init(value: 100, color: .mercury, category: "secondSvIn", index: 80)
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
            chartDataVM.secondSvIn = []
            chartDataVM.secondSvIn.append(BarChartDataModel(value: secondSvInRateRound, color: .ocean, category: "secondSvIn", index: 80))
            chartDataVM.secondSvIn.append(BarChartDataModel(value: 100 - secondSvInRateRound, color: .mercury, category: "secondSvIn", index: 80))
            chartDataVM.secondSvInCount = "\(secondSvInCount)/\(secondSvPoints.count)"
        }
        // noDoubleFault
        let noDoubleFaultCount = serverPoints.count - doubleFaultCount
        if serverPoints.count == 0 {
            chartDataVM.noDoubleFault = [
                .init(value: 0, color: .ocean, category: "noDoubleFault", index: 92),
                .init(value: 100, color: .mercury, category: "noDoubleFault", index: 92)
            ]
        } else {
            let noDoubleFaultRate = ( Float(noDoubleFaultCount) / Float(serverPoints.count) ) * 100
            let noDoubleFaultRateRound = round(noDoubleFaultRate * 10) / 10
            chartDataVM.noDoubleFault = []
            chartDataVM.noDoubleFault.append(BarChartDataModel(value: noDoubleFaultRateRound, color: .ocean, category: "noDoubleFault", index: 92))
            chartDataVM.noDoubleFault.append(BarChartDataModel(value: 100 - noDoubleFaultRateRound, color: .mercury, category: "noDoubleFault", index: 92))
            chartDataVM.noDoubleFaultCount = "\(noDoubleFaultCount)/\(serverPoints.count)"
        }
        // atFirstSv
        let atFirstGet = firstInPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if firstInPoints.count == 0 {
            chartDataVM.atFirstSv = [
                .init(value: 0, color: .ocean, category: "atFirstSv", index: 60),
                .init(value: 100, color: .mercury, category: "atFirstSv", index: 60)
            ]
        } else {
            let atFirstRate = ( Float(atFirstGet.count) / Float(firstInPoints.count) ) * 100
            let atFirstRateRound = round(atFirstRate * 10) / 10
            chartDataVM.atFirstSv = []
            chartDataVM.atFirstSv.append(BarChartDataModel(value: atFirstRateRound, color: .ocean, category: "atFirstSv", index: 60))
            chartDataVM.atFirstSv.append(BarChartDataModel(value: 100 - atFirstRateRound, color: .mercury, category: "atFirstSv", index: 60))
            chartDataVM.atFirstSvCount = "\(atFirstGet.count)/\(firstInPoints.count)"
        }
        // atSecondSv
        let atSecondGet = secondSvPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if secondSvPoints.count == 0 {
            chartDataVM.atSecondSv = [
                .init(value: 0, color: .ocean, category: "atSecondSv", index: 50),
                .init(value: 100, color: .mercury, category: "atSecondSv", index: 50)
            ]
        } else {
            let atSecondRate = ( Float(atSecondGet.count) / Float(secondSvPoints.count) ) * 100
            let atSecondRateRound = round(atSecondRate * 10) / 10
            chartDataVM.atSecondSv = []
            chartDataVM.atSecondSv.append(BarChartDataModel(value: atSecondRateRound, color: .ocean, category: "atSecondSv", index: 50))
            chartDataVM.atSecondSv.append(BarChartDataModel(value: 100 - atSecondRateRound, color: .mercury, category: "atSecondSv", index: 50))
            chartDataVM.atSecondSvCount = "\(atSecondGet.count)/\(secondSvPoints.count)"
        }
        // getAndLostPoint
        let getPoints = results.filter{
            $0.whichPoint == "myTeam"
        }
        let lostPoints = results.filter{
            $0.whichPoint == "opponent"
        }
        chartDataVM.getAndLostPoint = []
        chartDataVM.getAndLostPoint.append(PieChartDataModel(
            name: "data1",
            nameString: "とった\nポイント",
            value: Double(getPoints.count),
            labelType: .twoLabels
        ))
        chartDataVM.getAndLostPoint.append(PieChartDataModel(
            name: "data2",
            nameString: "とられた\nポイント",
            value: Double(lostPoints.count),
            labelType: .twoLabels
        ))
        chartDataVM.getAndLostPoint.append(PieChartDataModel(
            name: "blank",
            nameString: "",
            value: Double(getPoints.count + lostPoints.count),
            labelType: .twoLabels
        ))
        
    }
    
    func setGameChart(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let games = realm.objects(GameDataModel.self).where({
            $0.matchId == matchInfoVM.matchId
            && $0.getPoint != $0.lostPoint
        })
        if games.count != 0 {
            // keepAndBreakPoint
            var keepRate: Double = 0
            var breakRate: Double = 0
            var serviceLostRate: Double = 0
            var returnLostRate: Double = 0
            let serviceGames = games.filter{
                $0.servOrRet == "serviceGame"
            }
            if serviceGames.count != 0 {
                let keepGames = serviceGames.filter{ $0.getPoint > $0.lostPoint}
                let serviceLostGames = serviceGames.filter{ $0.getPoint < $0.lostPoint}
                keepRate = round((Double(keepGames.count)/Double(serviceGames.count)) * 1000) / 10
                serviceLostRate = round((Double(serviceLostGames.count)/Double(serviceGames.count)) * 1000) / 10
            }
            let returnGames = games.filter{
                $0.servOrRet == "returnGame"
            }
            if returnGames.count != 0 {
                let breakGames = returnGames.filter{ $0.getPoint > $0.lostPoint}
                let returnLostGames = returnGames.filter{ $0.getPoint < $0.lostPoint}
                breakRate = round((Double(breakGames.count)/Double(returnGames.count)) * 1000) / 10
                returnLostRate = round((Double(returnLostGames.count)/Double(returnGames.count)) * 1000) / 10
            }
            chartDataVM.keepAndBreak = []
            chartDataVM.keepAndBreak.append(PieChartDataModel(
                name: "data1",
                nameString: "キープ率",
                value: keepRate,
                labelType: .keepAndBreak))
            chartDataVM.keepAndBreak.append(PieChartDataModel(
                name: "data2",
                nameString: "ブレーク率",
                value: breakRate,
                labelType: .keepAndBreak))
            chartDataVM.keepAndBreak.append(PieChartDataModel(
                name: "data3",
                nameString: "サービス\nロスト率",
                value: serviceLostRate,
                labelType: .keepAndBreak))
            chartDataVM.keepAndBreak.append(PieChartDataModel(
                name: "data4",
                nameString: "リターン\nロスト率",
                value: returnLostRate,
                labelType: .keepAndBreak))
            chartDataVM.keepAndBreak.append(PieChartDataModel(
                name: "blank",
                nameString: "",
                value: keepRate + breakRate + serviceLostRate + returnLostRate,
                labelType: .keepAndBreak))
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
                showPointRealm()
            } else if pointVM.allPoint == 0 {
                positionVM.myPosition = .noSelection
                positionVM.servOrRet = ServOrRet(rawValue: pointData.last!.servOrRet)!
                positionVM.side = .noSelection
                pointVM.service = .first
                pointVM.getGameCount = pointData.last!.getGameCount
                pointVM.lostGameCount = pointData.last!.getGameCount
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
                showGameRealm()
            } else {
                if let lastPoint = pointData.last {
                    try! realm.write() {
                        realm.delete(lastPoint)
                    }
                }
                showPointRealm()
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
}
