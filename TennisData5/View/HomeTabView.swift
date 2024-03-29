
import SwiftUI

struct HomeTabView: View {
    
    @StateObject var dataManageVM = DataManageViewModel()
    @StateObject var interstitial = Interstitial()
    
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
            userVM: dataManageVM.userVM,
            interstitial: interstitial
        )
        .onAppear{
            Task {
                await dataManageVM.WCStartApp()
            }
            dataManageVM.homeVM.setHomeData()
            dataManageVM.userVM.setUserInfo()
            interstitial.loadInterstitial()
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
            .onDisappear(){
                interstitial.presentInterstitial()
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
            .onDisappear(){
                interstitial.presentInterstitial()
            }
    }
}
