import SwiftUI
struct HomeTabView: View {
    init() {
        let contentViewAp: UITabBarAppearance = UITabBarAppearance()
        contentViewAp.backgroundColor = .black
        UITabBar.appearance().scrollEdgeAppearance = contentViewAp
        UITabBar.appearance().standardAppearance = contentViewAp
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
            TabView {
                HomeView().tabItem {
                    Text("HOME")
                    Image(systemName: "house.fill")
                }
                MatchRecordView().tabItem {
                    Text("試合履歴")
                    Image(systemName: "list.bullet")
                }
                DataAnalysisView().tabItem {
                    Text("データ分析")
                    Image(systemName: "chart.pie.fill")
                }
            }
            .accentColor(.white)
    }
}

#Preview {
    HomeTabView()
}
