
import RealmSwift
import SwiftUI
import WatchConnectivity

extension DataManageViewModel {
    
    // サービスゲームを選択
    func serviceGame(){
        positionVM.servOrRet = .serviceGame
        positionVM.myPosition = .noSelection
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // リターンゲームを選択
    func returnGame(){
        positionVM.servOrRet = .returnGame
        positionVM.myPosition = .noSelection
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // デュースサイドのサーバーを選択
    func serverDuce(){
        positionVM.myPosition = .server
        positionVM.side = .duceSide
        positionVM.server = .mySelf
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // アドサイドのサーバーを選択
    func serverAdv(){
        positionVM.myPosition = .server
        positionVM.side = .advantageSide
        positionVM.server = .mySelf
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // デュースサイドのリターナーを選択
    func returnerDuce(){
        positionVM.myPosition = .returner
        positionVM.side = .duceSide
        positionVM.server = .opponent
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // アドサイドのリターナーを選択
    func returnerAdv(){
        positionVM.myPosition = .returner
        positionVM.side = .advantageSide
        positionVM.server = .opponent
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // サービスゲームのボレーヤーデュースサイド
    func volleyerServDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .partner
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // サービスゲームのボレーヤーアドサイド
    func volleyerServAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .partner
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // リターンゲームのボレーヤーデュースサイド
    func volleyerRetDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .opponent
        Task {
            await self.WCSelectPositionAndService()
        }
    }
    
    // リターンゲームのボレーヤーアドサイド
    func volleyerRetAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .opponent
        Task {
            await self.WCSelectPositionAndService()
        }
    }
}
