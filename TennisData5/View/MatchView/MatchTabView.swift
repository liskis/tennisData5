import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    init(matchFormat: Binding<MatchFormat>,gameType: Binding<GameType>) {
        self._matchFormat = matchFormat
        self._gameType = gameType
        let contentViewAp: UITabBarAppearance = UITabBarAppearance()
        contentViewAp.backgroundColor = .black
        UITabBar.appearance().scrollEdgeAppearance = contentViewAp
        UITabBar.appearance().standardAppearance = contentViewAp
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
        TabView {
<<<<<<< HEAD
            if gameType == .pointGame {
                PointGameInputView(matchFormat: $matchFormat)
=======
            if matchFormat == .singles && gameType == .pointGame {
                SnglsPintGmPointInputView()
>>>>>>> 7f5c7b92233c277265fb174476d2cdc074b1198d
                    .tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
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
    HomeTabView()
}
