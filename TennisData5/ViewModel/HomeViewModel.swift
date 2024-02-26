
import Foundation
import RealmSwift

class HomeViewModel: ObservableObject, Codable {
    
    @Published var winningRate: String = "--.-"
    @Published var winningCount: String = "(0/0)"
    @Published var firstSvInRate: String = "--.-"
    @Published var firstSvInCount: String = "(0/0)"
    @Published var secondSvInRate: String = "--.-"
    @Published var secondSvInCount: String = "(0/0)"
    @Published var keepRate: String = "--.-"
    @Published var keepCount: String = "(0/0)"
    @Published var breakRate: String = "--.-"
    @Published var breakCount: String = "(0/0)"
    @Published var firstSvInChartData: [LineChartDataModel] = []
    @Published var secondSvInChartData: [LineChartDataModel] = []
    @Published var doubleFaultRateChartData: [LineChartDataModel] = []
    @Published var signPost: [LineChartDataModel] = []
    @Published var winLoseArray: [WinLoseArray] = []
    @Published var dateArray: [DateArray] = []
    @Published var toPointGameView: Bool = false
    @Published var toOneMatchDataView: Bool = false
    
    /// データを算出するためのパラメータ
    private var win:Int = 0
    private var lose:Int = 0
    private var draw:Int = 0
    private var serverPointCount: Int = 0
    private var firstInPointCount: Int = 0
    private var secondPointCount: Int = 0
    private var secondInPointCount: Int = 0
    private var serviceGameCount: Int = 0
    private var keepGameCount: Int = 0
    private var returnGameCount: Int = 0
    private var breakGameCount: Int = 0
    private var num: Int = 0
    
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
    
    /// realmのインスタンス
    var realm: Realm {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 8)
        let realm = try! Realm()
        return realm
    }
    
    /// Homeのチャートをセットする
    func setHomeData(){
        
        resetParameter()
        let setDataArray = realm.objects(SetDataModel.self)
        if setDataArray.count != 0 {
            let latest5Sets = setDataArray.suffix(5)
            for setData in latest5Sets  {
                let serverPoints = realm.objects(PointDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.myPosition == "server"
                })
                let secondPoints = realm.objects(PointDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.myPosition == "server"
                    && $0.service == "second"
                })
                let serviceGames = realm.objects(GameDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.servOrRet == "serviceGame"
                })
                let returnGames = realm.objects(GameDataModel.self).where({
                    $0.setId == setData.setId
                    && $0.servOrRet == "returnGame"
                })
                // スタッツデータエリア
                addWinLoseDrow(setData: setData)
                setFirstSvInParameter(serverPoints: Array(serverPoints))
                setSecondSvInParameter(secondPoints: Array(secondPoints))
                setKeepRate(serviceGames: Array(serviceGames))
                setBreakRate(returnGames: Array(returnGames))
                
                // チャードデータ
                setFirstSvInChart(serverPoints: Array(serverPoints))
                setSecondSvInChart(secondPoints: Array(secondPoints))
                setDoubleFaultChart(
                    serverPoints: Array(serverPoints),
                    secondPoints: Array(secondPoints)
                )
                
                // チャートの表示を安定させるためのガイド
                self.signPost.append(LineChartDataModel(num: num, stats: 100, category: "signPost", color: "clear"))
                
                // winLoseArray
                setWinLoseDate(setData: setData)
                
                num += 1
            }
            
            setRateAndCount()
        }
    }
    
    // パラメーターをリセット
    private func resetParameter(){
        
        firstSvInChartData = []
        secondSvInChartData = []
        doubleFaultRateChartData = []
        signPost = []
        winLoseArray = []
        dateArray = []
        win = 0
        lose = 0
        draw = 0
        serverPointCount = 0
        firstInPointCount = 0
        secondPointCount = 0
        secondInPointCount = 0
        serviceGameCount = 0
        keepGameCount = 0
        returnGameCount = 0
        breakGameCount = 0
        num = 0
    }
    
    //  勝った数と負けた数、引き分けの数を累積していく
    private func addWinLoseDrow(setData: SetDataModel) {
        
        if setData.getGameCount > setData.lostGameCount {
            win += 1
        } else if setData.getGameCount < setData.lostGameCount {
            lose += 1
        } else {
            draw += 1
        }
    }
    
    // サーバーのポイント数とファーストサーブが入ったポイントを累積
    private func setFirstSvInParameter(serverPoints: [PointDataModel]) {
        
        let firstInPoints = serverPoints.filter{ $0.service == "first" }
        serverPointCount += serverPoints.count
        firstInPointCount += firstInPoints.count
    }
    
    // セカンドサーブの数と入った数を累積
    private func setSecondSvInParameter(secondPoints: [PointDataModel]) {
        
        let doubleFaultPoints = secondPoints.filter{
            $0.whichPoint == "opponent"
            && $0.shot == "serve"
        }
        secondPointCount += secondPoints.count
        secondInPointCount += secondPoints.count - doubleFaultPoints.count
    }
    
    // キープ率をセット
    private func setKeepRate(serviceGames: [GameDataModel]) {
        
        serviceGameCount += serviceGames.count
        let keepGames = serviceGames.filter{ $0.getPoint > $0.lostPoint }
        keepGameCount += keepGames.count
    }
    
    // ブレーク率をセット
    private func setBreakRate(returnGames: [GameDataModel]) {
        
        returnGameCount += returnGames.count
        let breakGames = returnGames.filter{ $0.getPoint > $0.lostPoint }
        breakGameCount += breakGames.count
    }
    
    // ファーストサーブの推移をセット
    private func setFirstSvInChart(serverPoints: [PointDataModel]) {
        
        let firstInPoints = serverPoints.filter{ $0.service == "first" }
        if serverPoints.count != 0 {
            let stats = Int((Double(firstInPoints.count)/Double(serverPoints.count))*100)
            self.firstSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "1stサーブin", color: "orange"))
        }
    }
    
    // セカンドサーブの推移をセット
    private func setSecondSvInChart(secondPoints: [PointDataModel]) {
        
        let doubleFaultPoints = secondPoints.filter{
            $0.whichPoint == "opponent"
            && $0.shot == "serve"
        }
        let secondIn = secondPoints.count - doubleFaultPoints.count
        if secondPoints.count != 0 {
            let stats = Int((Double(secondIn) / Double(secondPoints.count))*100)
            self.secondSvInChartData.append(LineChartDataModel(num: num, stats: stats, category: "2ndサーブin", color: "red"))
        }
    }
    
    // ダブルフォルトの推移をセット
    private func setDoubleFaultChart(serverPoints: [PointDataModel], secondPoints: [PointDataModel]) {
        
        let doubleFaultPoints = secondPoints.filter{
            $0.whichPoint == "opponent"
            && $0.shot == "serve"
        }
        if serverPoints.count != 0 {
            let stats = Int((Double(doubleFaultPoints.count)/Double(serverPoints.count) )*100)
            self.doubleFaultRateChartData.append(LineChartDataModel(num: num, stats: stats, category: "ダブルフォルト率", color: "red"))
        }
    }
    
    // 勝敗と日付の配列をセット
    private func setWinLoseDate(setData: SetDataModel) {
        
        // 勝敗の配列
        if setData.getGameCount > setData.lostGameCount {
            self.winLoseArray.append(WinLoseArray(num: num, issue: .Win))
        } else if setData.getGameCount < setData.lostGameCount {
            self.winLoseArray.append(WinLoseArray(num: num, issue: .Lose))
        } else {
            self.winLoseArray.append(WinLoseArray(num: num, issue: .Draw))
        }
        
        // 日付の配列
        self.dateArray.append(DateArray(num: num, dateString: Date.dateToString(date: setData.setStartDate, format: "yy/MM/dd")))
    }
    
    /// 各種レートとカウントをセット
    private func setRateAndCount() {
        
        self.winningRate = String( format: "%.1f", (Double(win)/Double(win+lose+draw))*100)
        self.winningCount = "(\(win)/\( win + lose + draw))"
        
        if serverPointCount != 0 {
            self.firstSvInRate = String(format: "%.1f", (Double(firstInPointCount) / Double(serverPointCount))*100 )
        }
        self.firstSvInCount = "(\(firstInPointCount)/\(serverPointCount))"
        
        if secondPointCount != 0 {
            self.secondSvInRate = String(format: "%.1f", (Double(secondInPointCount) / Double(secondPointCount))*100 )
        }
        self.secondSvInCount = "(\(secondInPointCount)/\(secondPointCount))"
        
        if serviceGameCount != 0 {
            self.keepRate = String(format: "%.1f", (Double(keepGameCount) / Double(serviceGameCount))*100 )
        }
        self.keepCount = "(\(keepGameCount)/\(serviceGameCount))"
        
        if returnGameCount != 0 {
            self.breakRate = String(format: "%.1f", (Double(breakGameCount) / Double(returnGameCount))*100 )
        }
        self.breakCount = "(\(breakGameCount)/\(returnGameCount))"
    }
}
