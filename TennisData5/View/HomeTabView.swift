import SwiftUI
struct HomeTabView: View {
    @StateObject var dataManageVM = DataManageViewModel()
    var body: some View {
        TabView {
            HomeView(
                dataManageVM: dataManageVM,
                homeVM: dataManageVM.homeVM,
                userVM: dataManageVM.userVM
            )
                .onAppear{
//                    dataManageVM.deleteRealm()
//                    Task{
//                        await dataManageVM.WCStartApp()
//                    }
                    dataManageVM.homeVM.setHomeData()
                    dataManageVM.userVM.setUserInfo()
                    
                }
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("HOME", systemImage: "house.fill")
                }
            MatchRecordView()
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("試合履歴", systemImage: "list.bullet")
                }
            DataAnalysisView()
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("データ分析", systemImage: "chart.pie.fill")
                }
        }
        .accentColor(.white)
    }
}
