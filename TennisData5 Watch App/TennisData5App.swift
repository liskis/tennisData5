import SwiftUI
import WatchConnectivity
@main
struct TennisData5_Watch_AppApp: App {
    @StateObject var dataManageVM = DataManageViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(
                dataManageVM: dataManageVM,
                homeVM: dataManageVM.homeVM
            )
                .onAppear {
//                    dataManageVM.deleteRealm()
//                    Task{
//                        await dataManageVM.WCStartApp()
//                    }
                    dataManageVM.homeVM.setHomeData()
                }
        }
    }
}
