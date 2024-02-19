import Foundation
import SwiftUI
import RealmSwift
class ChartDataViewModel: ObservableObject {
    @Published var firstSvInCount: String = "No Data"
    @Published var firstSvIn: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "firstSvIn", index: 60),
        .init(value: 100, color: .mercury, category: "firstSvIn", index: 60)
    ]
    @Published var secondSvInCount: String = "No Data"
    @Published var secondSvIn: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "secondSvIn", index: 80),
        .init(value: 100, color: .mercury, category: "secondSvIn", index: 80)
    ]
    @Published var doubleFaultCount: String = "No Data"
    @Published var doubleFault: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "doubleFault", index: 8),
        .init(value: 100, color: .mercury, category: "doubleFault", index: 8)
    ]
    @Published var atFirstSvCount: String = "No Data"
    @Published var atFirstSv: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "atFirstSv", index: 60),
        .init(value: 100, color: .mercury, category: "atFirstSv", index: 60)
    ]
    @Published var atSecondSvCount: String = "No Data"
    @Published var atSecondSv: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "atSecondSv", index: 50),
        .init(value: 100, color: .mercury, category: "atSecondSv", index: 50)
    ]
    
    @Published var getAndLostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "とった\nポイント", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "とられた\nポイント", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var getAndLostPointStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .tangerine, "blank": .white
    ]
    @Published var keepAndBreak: [PieChartDataModel] = [
        .init(name: "data1", nameString: "キープ率", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ブレーク率", value: 1, labelType: .twoLabels),
        
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var keepAndBreakStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .aqua, "blank": .white
    ]
    @Published var pointRateBySvOrVoly: [PieChartDataModel] = [
        .init(name: "data1", nameString: "サーバー", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByRetOrVoly: [PieChartDataModel] = [
        .init(name: "data1", nameString: "リターナー", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByServiceSide: [PieChartDataModel] = [
        .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByReturnSide: [PieChartDataModel] = [
        .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .aqua, "blank": .white
    ]
    
    @Published var keepAndBreakStyleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "data3": .silver, "data4": .silver ,"blank": .white
    ]
    @Published var winnerPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var missPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var getPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var lostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    
    @Published var styleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "blank": .white
    ]
    
    @Published var winnerPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手が\n決めた", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var missPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "味方の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var getPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手の\nミス", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var lostPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var styleScaleDisDbls: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "data3": .silver, "blank": .white
    ]
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    func returnInitialValue(){
        firstSvInCount = "No Data"
        firstSvIn = [
            .init(value: 0, color: .blue, category: "firstSvIn", index: 60),
            .init(value: 100, color: .mercury, category: "firstSvIn", index: 60)
        ]
        secondSvInCount = "No Data"
        secondSvIn = [
            .init(value: 0, color: .blue, category: "secondSvIn", index: 80),
            .init(value: 100, color: .mercury, category: "secondSvIn", index: 80)
        ]
        doubleFaultCount = "No Data"
        doubleFault = [
            .init(value: 0, color: .blue, category: "doubleFault", index: 8),
            .init(value: 100, color: .mercury, category: "doubleFault", index: 8)
        ]
        atFirstSvCount = "No Data"
        atFirstSv = [
            .init(value: 0, color: .blue, category: "atFirstSv", index: 60),
            .init(value: 100, color: .mercury, category: "atFirstSv", index: 60)
        ]
        atSecondSvCount = "No Data"
        atSecondSv = [
            .init(value: 0, color: .blue, category: "atSecondSv", index: 50),
            .init(value: 100, color: .mercury, category: "atSecondSv", index: 50)
        ]
        
        getAndLostPoint = [
            .init(name: "data1", nameString: "とった\nポイント", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "とられた\nポイント", value: 1, labelType: .twoLabels),
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        getAndLostPointStyleScale = [
            "data1": .blue, "data2": .tangerine, "blank": .white
        ]
        keepAndBreak = [
            .init(name: "data1", nameString: "キープ率", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "ブレーク率", value: 1, labelType: .twoLabels),
            
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        keepAndBreakStyleScale = [
            "data1": .blue, "data2": .aqua, "blank": .white
        ]
        pointRateBySvOrVoly = [
            .init(name: "data1", nameString: "サーバー", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        pointRateByRetOrVoly = [
            .init(name: "data1", nameString: "リターナー", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        pointRateByServiceSide = [
            .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        pointRateByReturnSide = [
            .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
            .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
            .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
        ]
        pointRateStyleScale = [
            "data1": .blue, "data2": .aqua, "blank": .white
        ]
        
        keepAndBreakStyleScaleDis = [
            "data1": .silver, "data2": .silver, "data3": .silver, "data4": .silver ,"blank": .white
        ]
    }
    func setChartData(matchId:String, allCount:Int){
        let results = realm.objects(PointDataModel.self).where({ $0.matchId == matchId })
        
        // firstServeIn
        let serverPoints = results.filter{ $0.myPosition == "server"}
        let firstInPoints = serverPoints.filter{ $0.service == "first"}
        if serverPoints.count == 0 {
            firstSvIn = [
                .init(value: 0, color: .blue, category: "firstSvIn", index: 60),
                .init(value: 100, color: .mercury, category: "firstSvIn", index: 60)
            ]
        } else {
            let firstSvInRate = (Float(firstInPoints.count) / Float(serverPoints.count))*100
            let fiestSvInRateRound = round(firstSvInRate * 10) / 10
            firstSvIn = [
                .init(value: fiestSvInRateRound, color: .blue, category: "firstSvIn", index: 60),
                .init(value: 100 - fiestSvInRateRound, color: .mercury, category: "firstSvIn", index: 60)
            ]
            
            firstSvInCount = "\(firstInPoints.count)/\(serverPoints.count)"
        }
        // secondSvIn
        let secondSvPoints = serverPoints.filter{
            $0.service == "second"
        }
        var DFCount: Int = 0
        if secondSvPoints.count == 0 {
            secondSvIn = [
                .init(value: 0, color: .blue, category: "secondSvIn", index: 80),
                .init(value: 100, color: .mercury, category: "secondSvIn", index: 80)
            ]
        } else {
            let doubleFaultPoints = secondSvPoints.filter{
                $0.whichPoint == "opponent"
                && $0.shot == "serve"
            }
            DFCount = doubleFaultPoints.count
            let secondSvInPointCount = secondSvPoints.count - DFCount
            let secondSvInRate = ( Float(secondSvInPointCount) / Float(secondSvPoints.count) ) * 100
            let secondSvInRateRound = round(secondSvInRate * 10) / 10
            secondSvIn = [
                .init(value: secondSvInRateRound, color: .blue, category: "secondSvIn", index: 80),
                .init(value: 100 - secondSvInRateRound, color: .mercury, category: "secondSvIn", index: 80)
            ]
            secondSvInCount = "\(secondSvInPointCount)/\(secondSvPoints.count)"
        }
        // doubleFault
        if serverPoints.count == 0 {
            doubleFault = [
                .init(value: 0, color: .blue, category: "doubleFault", index: 8),
                .init(value: 100, color: .mercury, category: "doubleFault", index: 8)
            ]
        } else {
            let doubleFaultRate = ( Float(DFCount) / Float(serverPoints.count) ) * 100
            let doubleFaultRateRound = round(doubleFaultRate * 10) / 10
            doubleFault = [
                .init(value: doubleFaultRateRound, color: .blue, category: "doubleFault", index: 8),
                .init(value: 100 - doubleFaultRateRound, color: .mercury, category: "doubleFault", index: 8)
            ]
            doubleFaultCount = "\(DFCount)/\(serverPoints.count)"
        }
        // atFirstSv
        let atFirstGet = firstInPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if firstInPoints.count == 0 {
            atFirstSv = [
                .init(value: 0, color: .blue, category: "atFirstSv", index: 60),
                .init(value: 100, color: .mercury, category: "atFirstSv", index: 60)
            ]
        } else {
            let atFirstRate = ( Float(atFirstGet.count) / Float(firstInPoints.count) ) * 100
            let atFirstRateRound = round(atFirstRate * 10) / 10
            atFirstSv = [
                .init(value: atFirstRateRound, color: .blue, category: "atFirstSv", index: 60),
                .init(value: 100 - atFirstRateRound, color: .mercury, category: "atFirstSv", index: 60)
            ]
            atFirstSvCount = "\(atFirstGet.count)/\(firstInPoints.count)"
        }
        // atSecondSv
        let atSecondGet = secondSvPoints.filter{
            $0.whichPoint == "myTeam"
        }
        if secondSvPoints.count == 0 {
            atSecondSv = [
                .init(value: 0, color: .blue, category: "atSecondSv", index: 50),
                .init(value: 100, color: .mercury, category: "atSecondSv", index: 50)
            ]
        } else {
            let atSecondRate = ( Float(atSecondGet.count) / Float(secondSvPoints.count) ) * 100
            let atSecondRateRound = round(atSecondRate * 10) / 10
            atSecondSv = [
                .init(value: atSecondRateRound, color: .blue, category: "atSecondSv", index: 50),
                .init(value: 100 - atSecondRateRound, color: .mercury, category: "atSecondSv", index: 50)
            ]
            atSecondSvCount = "\(atSecondGet.count)/\(secondSvPoints.count)"
        }
        // pieChart
        // getAndLostPoint
        if allCount == 0 {
            getAndLostPoint = [
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
            getAndLostPoint = [
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
            pointRateBySvOrVoly = [
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
            pointRateBySvOrVoly = [
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
            pointRateByRetOrVoly = [
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
                $0.servOrRet == "returnGame"
                && $0.myPosition == "volleyer"
            }
            if volleyerAtRetPoints.count != 0 {
                let getVolleyerAtRetPoints = volleyerAtRetPoints.filter{
                    $0.whichPoint == "myTeam"
                }
                volleyerAtRetGetRate = round( ( Double(getVolleyerAtRetPoints.count) / Double(volleyerAtRetPoints.count) ) * 1000 ) / 10
            }
            pointRateByRetOrVoly = [
                .init(name: "data1", nameString: "リターナー", value: returnerGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "ボレーヤー", value: volleyerAtRetGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: returnerGetRate + volleyerAtRetGetRate, labelType: .twoLabels)
            ]
        }
        
        // pointRateByServiceSide
        if serviceGamePoints.count == 0 {
            pointRateByServiceSide = [
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
            pointRateByServiceSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: duceGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: advGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: duceGetRate + advGetRate, labelType: .twoLabels)
            ]
        }
        // pointRateByReturnSide
        
        if returnGamePoints.count == 0 {
            pointRateByReturnSide = [
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
            pointRateByReturnSide = [
                .init(name: "data1", nameString: "フォア\nサイド", value: duceGetRate, labelType: .twoLabels),
                .init(name: "data2", nameString: "バック\nサイド", value: advGetRate, labelType: .twoLabels),
                .init(name: "blank", nameString: "", value: duceGetRate + advGetRate, labelType: .twoLabels)
            ]
        }
    }
    func setGameChart(matchId:String){
        let games = realm.objects(GameDataModel.self).where({
            $0.matchId == matchId
            && $0.getPoint != $0.lostPoint
        })
        if games.count == 0 {
            keepAndBreak = [
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
                keepAndBreak = [
                    .init(name: "data1", nameString: "キープ率", value: keepRate, labelType: .twoLabels),
                    .init(name: "data2", nameString: "ブレーク率", value: breakRate, labelType: .twoLabels),
                    .init(name: "blank", nameString: "", value: keepRate + breakRate, labelType: .twoLabels)
                ]
                keepAndBreakStyleScale = [
                    "data1": .blue, "data2": .aqua, "blank": .white
                ]
            } else {
                keepAndBreak = [
                    .init(name: "data1", nameString: "キープ率", value: keepRate, labelType: .twoLabels),
                    .init(name: "data2", nameString: "ブレーク率", value: breakRate, labelType: .twoLabels),
                    .init(name: "data3", nameString: "あと", value: 100 - keepRate - breakRate, labelType: .twoLabels),
                    .init(name: "blank", nameString: "", value: 100, labelType: .twoLabels)
                ]
                keepAndBreakStyleScale = [
                    "data1": .blue, "data2": .aqua, "data3": .red, "blank": .white
                ]
            }
            
        }
    }
}
