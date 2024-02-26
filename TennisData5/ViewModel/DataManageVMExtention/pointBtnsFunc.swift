
import RealmSwift
import SwiftUI
import WatchConnectivity

extension DataManageViewModel {
    
    // シングルスでポイントを取った
    func getPointSngls() {
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
            let pointData = self.pointRecoad()
            
            Task {
                await self.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            pointVM.service = .first
            pointVM.whichPoint = .noSelection
        }
    }
    
    // シングルスでポイントを取られた
    func lostPointSngls() {
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .opponent
            pointVM.lostPoint += 1
            let pointData = self.pointRecoad()
            Task {
                await self.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            pointVM.service = .first
            pointVM.whichPoint = .noSelection
        }
    }
    
    // ダブルスでポイントを取った
    func getPointDbls() {
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
            let pointData = self.pointRecoad()
            Task {
                await self.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            if positionVM.servOrRet == .returnGame {
                if positionVM.myPosition == .volleyer {
                    positionVM.myPosition = .returner
                } else {
                    positionVM.myPosition = .volleyer
                }
            }
            pointVM.service = .first
        }
    }
    
    // ダブルスでポイントを取られた
    func lostPointDbls() {
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .opponent
            pointVM.lostPoint += 1
            let pointData = self.pointRecoad()
            Task {
                await self.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            if positionVM.servOrRet == .returnGame {
                if positionVM.myPosition == .volleyer {
                    positionVM.myPosition = .returner
                } else {
                    positionVM.myPosition = .volleyer
                }
            }
            pointVM.service = .first
        }
    }
    
    /// フォルト
    func fault(){
        /// ポジションが選択されていないときにserviceをsecondにする
        if positionVM.myPosition != .noSelection {
            pointVM.service = .second
        }
        /// Watchに送信
        Task {
            await WCSelectPositionAndService()
        }
    }
    
    /// ダブルフォルト
    func doubleFault(){
        /// サービスゲームの時は自分の失点
        if positionVM.servOrRet == .serviceGame {
            pointVM.whichPoint = .opponent
            pointVM.lostPoint += 1
        /// リターンゲームの時は相手の失点
        } else if positionVM.servOrRet == .returnGame {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
        }
        /// shotをserveにしてから保存・送信
        pointVM.shot = .serve
        let pointData = pointRecoad()
        Task {
            await WCGetAndLostPoint(pointData:pointData)
        }
        /// サイドを更新
        if positionVM.side == .advantageSide {
            positionVM.side = .duceSide
        } else if positionVM.side == .duceSide {
            positionVM.side = .advantageSide
        }
        /// ダブルスのリターンゲームの時はボレーヤーとリターナーを変更
        if matchInfoVM.matchFormat == .doubles && positionVM.servOrRet == .returnGame {
            if positionVM.myPosition == .volleyer {
                positionVM.myPosition = .returner
            } else {
                positionVM.myPosition = .volleyer
            }
        }
        ///初期値に戻す
        pointVM.service = .first
        pointVM.whichPoint = .noSelection
        pointVM.shot = .noSelection
    }
}
