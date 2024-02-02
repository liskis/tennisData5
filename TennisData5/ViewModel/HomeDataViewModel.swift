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
    func setHomeData(){
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 4)
        let realm = try! Realm()
        // 勝率
        var win:Int = 0
        var lose:Int = 0
        var draw:Int = 0
        let matchEndData = realm.objects(PointDataModel.self).where({ $0.matchEnd == "end" }).sorted(byKeyPath: "matchStartDate", ascending: false)
        if matchEndData.count != 0 {
            var serverPointCount: Int = 0
            var firstInPointCount: Int = 0
            var secondPointCount: Int = 0
            var secondInPointCount: Int = 0
            var num: Int = matchEndData.count - 1
            if num > 4 {
                num = 4
            }
            firstSvInChartData = []
            secondSvInChartData = []
            for endData in matchEndData {
                //  勝率
                if endData.winCount > endData.loseCount {
                    win += 1
                } else if endData.winCount < endData.loseCount {
                    lose += 1
                } else {
                    draw += 1
                }
                
                // ファーストサーブ
                let serverPoints = realm.objects(PointDataModel.self).where({
                    $0.matchId == endData.matchId
                    && $0.myPosition == "server"
                })
                let firstInPoints = serverPoints.filter{
                    $0.service == "first"
                }
                serverPointCount += serverPoints.count
                firstInPointCount += firstInPoints.count
                
                // セカンドサーブ
                let secondPoints = realm.objects(PointDataModel.self).where({
                    $0.matchId == endData.matchId
                    && $0.myPosition == "server"
                    && $0.service == "second"
                })
                let doubleFaultPoints = secondPoints.filter{
                    $0.getPoint == "opponent"
                    && $0.shot == "serve"
                }
                secondPointCount += secondPoints.count
                secondInPointCount += secondPoints.count - doubleFaultPoints.count
                
                // グラフデータ
//                let dateString: String = Date.dateToString(date: endData.matchStartDate, format: "yy/MM/dd")
                let dateString: String = Date.dateToString(date: endData.matchStartDate, format: "HH:mm:ss")
                var category: String = "data1"
                var issue: Issue = .Draw
                var stats: Int = 0
                
                // ファーストサーブ
                if serverPoints.count != 0 {
                    stats = Int( ( Double(firstInPoints.count)/Double(serverPoints.count) )*100 )
                } else {
                    stats = 0
                }
                if endData.winCount > endData.loseCount {
                    issue = .Win
                } else if endData.winCount < endData.loseCount {
                    issue = .Lose
                } else {
                    issue = .Draw
                }
                firstSvInChartData.append(LineChartDataModel(num: num, dateString: dateString, stats: stats, category: category, issue: issue))
                // セカンドサーブ
                category = "data2"
                let secondIn = secondPoints.count - doubleFaultPoints.count
                if secondPoints.count == 0 {
                    if serverPoints.count == 0 {
                        stats = 0
                    } else {
                        stats = 100
                    }
                } else {
                    stats = Int((Double(secondIn) / Double(secondPoints.count))*100)
                }
                secondSvInChartData.append(LineChartDataModel(num: num, dateString: dateString, stats: stats, category: category, issue: issue))
                if num == 0 {
                    break
                }
                num -= 1
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
            firstSvInChartData.sort(by: {$0.num < $1.num})
            secondSvInChartData.sort(by: {$0.num < $1.num})
            print(firstSvInChartData)
            print(secondSvInChartData)
        }
    }
}
