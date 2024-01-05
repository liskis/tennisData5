import SwiftUI
struct MatchTabView: View {
    @Binding var gameType: String
    init(gameType: Binding<String>) {
        self._gameType = gameType
        let contentViewAp: UITabBarAppearance = UITabBarAppearance()
        contentViewAp.backgroundColor = .black
        UITabBar.appearance().scrollEdgeAppearance = contentViewAp
        UITabBar.appearance().standardAppearance = contentViewAp
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
        TabView {
            PointInputView(gameType:$gameType).tabItem {
                Text("ポイント入力")
                Image(systemName: "hand.point.up")
            }
            RealTimeDataView().tabItem {
                Text("リアルタイムデータ")
                Image(systemName: "gauge.with.dots.needle.67percent")
            }
        }
        .accentColor(.white)
    }
}


#Preview {
    ContentView()
}
