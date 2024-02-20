import SwiftUI
import WatchConnectivity
@main
struct TennisData5_Watch_AppApp: App {
    @StateObject var dataManageVM = DataManageViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView(
                dataManageVM: dataManageVM,
                userVM: dataManageVM.userVM,
                homeVM: dataManageVM.homeVM
            )
                .onAppear {
//                    dataManageVM.deleteRealm()
                    Task {
                        await dataManageVM.WCStartApp()
                    }
                    
                    dataManageVM.userVM.setUserInfo()
                    dataManageVM.homeVM.setHomeData()
                }
        }
    }
}
