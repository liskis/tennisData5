import Foundation
import RealmSwift
class HomeViewModel: ObservableObject, Codable {
    @Published var winningRate: String = "0.0"
    @Published var winningCount: String = "(0/0)"
    @Published var firstSvInRate: String = "0.0"
    @Published var firstSvInCount: String = "(0/0)"
    @Published var secondSvInRate: String = "0.0"
    @Published var secondSvInCount: String = "(0/0)"
    @Published var keepRate: String = "0.0"
    @Published var keepCount: String = "(0/0)"
    @Published var breakRate: String = "0.0"
    @Published var breakCount: String = "(0/0)"
    @Published var firstSvInChartData: [LineChartDataModel] = []
    @Published var secondSvInChartData: [LineChartDataModel] = []
    @Published var doubleFaultRateChartData: [LineChartDataModel] = []
    @Published var signPost: [LineChartDataModel] = []
    @Published var winLoseArray: [WinLoseArray] = []
    @Published var dateArray: [DateArray] = []
    @Published var toPointGameView: Bool = false
    @Published var toOneMatchDataView: Bool = false
    /// Codableに必要なので記載.
    init() {}
    /// 変換対象プロパティ指定.
    enum CodingKeys: String, CodingKey {
        case toPointGameView
        case toOneMatchDataView
    }
    /// プロパティのdecode（復号化）アクション.
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        toPointGameView = try container.decode(Bool.self, forKey: .toPointGameView)
        toOneMatchDataView = try container.decode(Bool.self, forKey: .toOneMatchDataView)
    }
    /// プロパティのencode（コード化）アクション.
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(toPointGameView, forKey: .toPointGameView)
        try container.encode(toOneMatchDataView, forKey: .toOneMatchDataView)
        
    }
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    func setHomeData(){
        let setDataArray = realm.objects(SetDataModel.self)
        if setDataArray.count != 0 {
            var win:Int = 0
            var lose:Int = 0
            var draw:Int = 0
            var serverPointCount: Int = 0
            var firstInPointCount: Int = 0
            var secondPointCount: Int = 0
            var secondInPointCount: Int = 0
            var serviceGameCount: Int = 0
            var keepGameCount: Int = 0
            var returnGameCount: Int = 0
            var breakGameCount: Int = 0
            firstSvInChartData = []
            secondSvInChartData = []
            doubleFaultRateChartData = []
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
                
                // keepRate
                let serviceGames = realm.objects(GameDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.servOrRet == "serviceGame"
                })
                serviceGameCount += serviceGames.count
                let keepGames = serviceGames.filter{
                    $0.getPoint > $0.lostPoint
                }
                keepGameCount += keepGames.count
                
                // breakRate
                let returnGames = realm.objects(GameDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.servOrRet == "returnGame"
                })
                returnGameCount += returnGames.count
                let breakGames = returnGames.filter{
                    $0.getPoint > $0.lostPoint
                }
                breakGameCount += breakGames.count
            // グラフデータ
                
                // ファーストサーブ
                if serverPoints.count != 0 {
                    let stats = Int((Double(firstInPoints.count)/Double(serverPoints.count))*100)
                    firstSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "1stサーブin", color: "orange"))
                }
                
                // セカンドサーブ
                let secondIn = secondPoints.count - doubleFaultPoints.count
                if secondPoints.count != 0 {
                    let stats = Int((Double(secondIn) / Double(secondPoints.count))*100)
                    secondSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "2ndサーブin", color: "red"))
                }
                
                // ダブルフォルト率
                if serverPoints.count != 0 {
                    let stats = Int((Double(doubleFaultPoints.count)/Double(serverPoints.count) )*100)
                    doubleFaultRateChartData.append(LineChartDataModel(num: num, stats: stats, category: "ダブルフォルト率", color: "red"))
                }
                
                
                // signPost
                signPost.append(LineChartDataModel(num: num, stats: 100, category: "signPost", color: "clear"))
                
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
            if serviceGameCount != 0 {
                keepRate = String(format: "%.1f", (Double(keepGameCount) / Double(serviceGameCount))*100 )
            }
            keepCount = "(\(keepGameCount)/\(serviceGameCount))"
            if returnGameCount != 0 {
                breakRate = String(format: "%.1f", (Double(breakGameCount) / Double(returnGameCount))*100 )
            }
            breakCount = "(\(breakGameCount)/\(returnGameCount))"
        }
    }
}
