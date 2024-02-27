
import SwiftUI

struct HomeTabView: View {
    
    @StateObject var dataManageVM = DataManageViewModel()
    
    var body: some View {
        TabView {
            homeView
            matchRecordView
            dataAnalysisView
        }
        .accentColor(.white)
    }
    
    // トップ画面
    private var homeView: some View {
        HomeView(
            dataManageVM: dataManageVM,
            homeVM: dataManageVM.homeVM,
            userVM: dataManageVM.userVM
        )
            .onAppear{
                Task {
                    await dataManageVM.WCStartApp()
                }
                dataManageVM.homeVM.setHomeData()
                dataManageVM.userVM.setUserInfo()
                dataManageVM.homeVM.adMobPopUp = false
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("HOME", systemImage: "house.fill")
            }
    }
    
    // 試合履歴画面
    private var matchRecordView: some View {
        MatchRecordView(homeVM: dataManageVM.homeVM)
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("試合履歴", systemImage: "list.bullet")
            }
            .onAppear{
                dataManageVM.homeVM.adMobPopUp = true
            }
    }
    
    // データ分析画面
    private var dataAnalysisView: some View {
        DataAnalysisView(homeVM: dataManageVM.homeVM)
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .tabItem {
                Label("データ分析", systemImage: "chart.pie.fill")
            }
            .onAppear{
                dataManageVM.homeVM.adMobPopUp = true
            }
    }
}
