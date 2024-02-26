
import RealmSwift
import SwiftUI
import WatchConnectivity

extension DataManageViewModel {
    
    /// シングルスポイントゲームへ
    func toSinglesPointGame() {
        matchInfoVM.matchFormat = .singles
        matchInfoVM.gameType = .pointGame
        matchInfoVM.matchId = UUID().uuidString
        matchInfoVM.setId = UUID().uuidString
        matchInfoVM.gameId = UUID().uuidString
        matchInfoVM.naviTitle = "シングルスポイントゲーム"
        Task{
            await self.WCToMatchView()
        }
        homeVM.toPointGameView = true
    }
    
    /// ダブルスポイントゲームへ
    func toDoublesPointGame() {
        matchInfoVM.matchFormat = .doubles
        matchInfoVM.gameType = .pointGame
        matchInfoVM.matchId = UUID().uuidString
        matchInfoVM.setId = UUID().uuidString
        matchInfoVM.gameId = UUID().uuidString
        matchInfoVM.naviTitle = "ダブルスポイントゲーム"
        Task{
            await self.WCToMatchView()
        }
        homeVM.toPointGameView = true
    }
    
    /// 一つ戻る
    func goBack(){
        /// 試合をスタートして何も入力していない状態
        if pointVM.allCount == 0 && positionVM.servOrRet == .noSelection {
            homeVM.toPointGameView = false
        } else {
            /// フォルトの時はフォルトをキャンセル
            if pointVM.service == .second {
                pointVM.service = .first
            ///  ポジションが選択されている時はポジションをキャンセル
            } else if positionVM.myPosition != .noSelection {
                positionVM.myPosition = .noSelection
            /// サーブorリターンが選択されているときはキャンセル
            } else if positionVM.servOrRet != .noSelection && pointVM.allPoint == 0 {
                positionVM.servOrRet = .noSelection
            /// 何も選択されていない時はrealmを元に前のポイントに戻る
            } else {
                goBackPoint()
                /// chartDataを更新する
                chartDataVM.setChartData(matchId: matchInfoVM.matchId, allCount: pointVM.allCount)
                chartDataVM.setGameChart(matchId: matchInfoVM.matchId)
            }
        }
    }
    
    /// 何も選択されていない時はrealmを元に前のポイントに戻る
    private func goBackPoint() {
        
        let pointData = realm.objects(PointDataModel.self).where({ $0.matchId == matchInfoVM.matchId })
        if pointData.count != 0{
            positionVM.myPosition = Position(rawValue: pointData.last!.myPosition)!
            positionVM.servOrRet = ServOrRet(rawValue: pointData.last!.servOrRet)!
            positionVM.side = Side(rawValue: pointData.last!.side)!
            pointVM.service = Service(rawValue: pointData.last!.service)!
            
            /// ０−０は保存されていないのでスコアを１−０から０−０にして、最後のPointDataを削除する
            if pointVM.allPoint == 1 {
                goBack0(lastPointData: pointData.last!)
            /// ０−０から戻る場合はGameCountも変更し、GameDataのみ削除する
            } else if pointVM.allPoint == 0 {
                goBackGame(lastPointData: pointData.last!)
            /// それ以外の場合は最後のPointDataを削除して一つ前のrealmに基づいてポイントを戻す
            } else {
                goBackGeneral(lastPointData: pointData.last!)
            }
        }
    }
    
    /// ０−０は保存されていないのでスコアを１−０から０−０にして、最後のPointDataを削除する
    private func goBack0(lastPointData: PointDataModel) {
        pointVM.getPoint = 0
        pointVM.lostPoint = 0
        try! realm.write() {
            realm.delete(lastPointData)
        }
        
    }
    
    /// ０−０から戻る場合はGameCountも変更し、GameDataのみ削除する
    private func goBackGame(lastPointData: PointDataModel) {
        positionVM.myPosition = .noSelection
        positionVM.servOrRet = ServOrRet(rawValue: lastPointData.servOrRet)!
        positionVM.side = .noSelection
        pointVM.service = .first
        pointVM.getGameCount = lastPointData.getGameCount
        pointVM.lostGameCount = lastPointData.lostGameCount
        pointVM.drowGameCount = lastPointData.drowGameCount
        pointVM.getPoint = lastPointData.getPoint
        pointVM.lostPoint = lastPointData.lostPoint
        matchInfoVM.gameId = lastPointData.gameId
        let games = realm.objects(GameDataModel.self).where({
            $0.matchId == matchInfoVM.matchId
        })
        if let lastGame = games.last {
            try! realm.write() {
                realm.delete(lastGame)
            }
        }
    }
    
    /// それ以外の場合は最後のPointDataを削除して一つ前のrealmに基づいてポイントを戻す
    private func goBackGeneral(lastPointData: PointDataModel) {
        try! realm.write() {
            realm.delete(lastPointData)
        }
        let results = realm.objects(PointDataModel.self).where({
            $0.matchId == matchInfoVM.matchId
        })
        pointVM.getPoint = results.last!.getPoint
        pointVM.lostPoint = results.last!.lostPoint
        matchInfoVM.gameId = results.last!.gameId
    }
    
    /// 次のゲームへ
    func nextGame() {
        // ポイントを更新
        if pointVM.getPoint > pointVM.lostPoint {
            pointVM.getGameCount += 1
        } else if pointVM.getPoint < pointVM.lostPoint {
            pointVM.lostGameCount += 1
        } else if pointVM.getPoint == pointVM.lostPoint {
            pointVM.drowGameCount += 1
        }
        
        ///ゲームデータを保存し、新しいゲームIDを発行してWatchに送る
        let gameData = gameRecoad()
        let newGameId = UUID().uuidString
        Task{
            await WCNextGame(
                gameData: gameData,
                newGameId: newGameId
            )
        }
        
        /// チャートデータを更新してポイントとポジションを初期値に戻す
        chartDataVM.setGameChart(matchId: matchInfoVM.matchId)
        pointVM.service = .first
        positionVM.myPosition = .noSelection
        positionVM.servOrRet = .noSelection
        pointVM.getPoint = 0
        pointVM.lostPoint = 0
        matchInfoVM.gameId = newGameId
    }
    
    /// 試合終了
    func gameEnd(){
        self.homeVM.adMobPopUp = true
        /// セットデータとマッチデータを保存し、watchに送る
        let setData = setRecoad()
        let matchData = matchRecoad()
        Task{
            await WCGameEnd(matchData: matchData, setData: setData)
        }
        
        /// ホームデータを更新し、チャート確認画面へ遷移
        homeVM.setHomeData()
        homeVM.toOneMatchDataView = true
    }
    
    func closeOneMatchDataView() {
        Task{
            await self.WCCloseOneMatchData()
        }
        self.resetAllVM()
        homeVM.toPointGameView = false
    }
}
