import Foundation
import RealmSwift
class HomeDataViewModel: ObservableObject {
    @Published var winningRate: String = "0.0"
    @Published var winningCount: String = "(0/0)"
    @Published var firstSvInRate: String = "0.0"
    @Published var firstSvInCount: String = "(0/0)"
    @Published var secondSvInRate: String = "0.0"
    @Published var secondSvInCount: String = "(0/0)"
    @Published var firstSvInChartData: [LineChartDataModel] = []
    @Published var secondSvInChartData: [LineChartDataModel] = []
    @Published var signPost: [LineChartDataModel] = []
    @Published var winLoseArray: [WinLoseArray] = []
    @Published var dateArray: [DateArray] = []
    func setHomeData(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 6)
        let realm = try! Realm()
        let setDataArray = realm.objects(SetDataModel.self)
        if setDataArray.count != 0 {
            var win:Int = 0
            var lose:Int = 0
            var draw:Int = 0
            var serverPointCount: Int = 0
            var firstInPointCount: Int = 0
            var secondPointCount: Int = 0
            var secondInPointCount: Int = 0
            firstSvInChartData = []
            secondSvInChartData = []
            signPost = []
            winLoseArray = []
            dateArray = []
            var num: Int = 0
            for setData in setDataArray.suffix(5) {
                //  勝率
                if setData.getGameCount > setData.lostGameCount {
                    win += 1
                } else if setData.getGameCount < setData.lostGameCount {
                    lose += 1
                } else {
                    draw += 1
                }
                
                // ファーストサーブ
                let serverPoints = realm.objects(PointDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.myPosition == "server"
                })
                let firstInPoints = serverPoints.filter{
                    $0.service == "first"
                }
                serverPointCount += serverPoints.count
                firstInPointCount += firstInPoints.count
                
                // セカンドサーブ
                let secondPoints = realm.objects(PointDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.myPosition == "server"
                    && $0.service == "second"
                })
                let doubleFaultPoints = secondPoints.filter{
                    $0.whichPoint == "opponent"
                    && $0.shot == "serve"
                }
                secondPointCount += secondPoints.count
                secondInPointCount += secondPoints.count - doubleFaultPoints.count
                
            // グラフデータ
                
                // ファーストサーブ
                if serverPoints.count != 0 {
                    let stats = Int( ( Double(firstInPoints.count)/Double(serverPoints.count) )*100 )
                    firstSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "data1"))
                }
                
                // セカンドサーブ
                let secondIn = secondPoints.count - doubleFaultPoints.count
                if secondPoints.count != 0 {
                    let stats = Int((Double(secondIn) / Double(secondPoints.count))*100)
                    secondSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "data2"))
                }
                
                // signPost
                signPost.append(LineChartDataModel(num: num, stats: 100, category: "data3"))
                
                // winLoseArray
                if setData.getGameCount > setData.lostGameCount {
                    winLoseArray.append(WinLoseArray(num: num, issue: .Win))
                } else if setData.getGameCount < setData.lostGameCount {
                    winLoseArray.append(WinLoseArray(num: num, issue: .Lose))
                } else {
                    winLoseArray.append(WinLoseArray(num: num, issue: .Draw))
                }
                
                // dateArray
                dateArray.append(DateArray(num: num, dateString: Date.dateToString(date: setData.setStartDate, format: "yy/MM/dd")))
//                dateArray.append(DateArray(num: num, dateString: Date.dateToString(date: endData.matchStartDate, format: "HH:mm:ss")))
                num += 1
                if num == setDataArray.count {
                    break
                }
            }
            winningRate = String( format: "%.1f", (Double(win)/Double(win+lose+draw))*100)
            winningCount = "(\(win)/\( win + lose + draw))"
            if serverPointCount != 0 {
                firstSvInRate = String(format: "%.1f", (Double(firstInPointCount) / Double(serverPointCount))*100 )
            }
            firstSvInCount = "(\(firstInPointCount)/\(serverPointCount))"
            if secondPointCount != 0 {
                secondSvInRate = String(format: "%.1f", (Double(secondInPointCount) / Double(secondPointCount))*100 )
            }
            secondSvInCount = "(\(secondInPointCount)/\(secondPointCount))"
        }
    }
}
