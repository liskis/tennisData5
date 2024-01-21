import SwiftUI
struct HomeTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .toolbarBackground(.black, for: .tabBar)
                .tabItem {
                Text("HOME")
                Image(systemName: "house.fill")
            }
            MatchRecordView()
                .toolbarBackground(.black, for: .tabBar)
                .tabItem {
                Text("試合履歴")
                Image(systemName: "list.bullet")
            }
            DataAnalysisView()
                .toolbarBackground(.black, for: .tabBar)
                .tabItem {
                Text("データ分析")
                Image(systemName: "chart.pie.fill")
            }
        } .accentColor(.white)
    }
}
