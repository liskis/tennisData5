import SwiftUI
struct HomeTabView: View {
    @ObservedObject var homeDataVM = HomeDataViewModel()
    @ObservedObject var userVM = UserViewModel()
    var body: some View {
        TabView {
            HomeView(homeDataVM: homeDataVM, userVM: userVM)
                .onAppear{
                    homeDataVM.setHomeData()
                    userVM.setUserInfo()
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
        } .accentColor(.white)
    }
}
