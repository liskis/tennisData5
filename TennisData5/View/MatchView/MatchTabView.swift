import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    init(matchFormat: Binding<MatchFormat>,
         gameType: Binding<GameType>
    ) {
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
            if matchFormat == .singles {
                if gameType == .pointGame {
                    SinglesPointGame().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else if gameType == .setMatch {
                    SinglesSetMatch().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else {
                    SinglesTieBreak().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                }
            } else {
                if gameType == .pointGame {
                    DoublesPointGame().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else if gameType == .setMatch {
                    DoublesSetMath().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else {
                    DoublesTieBreak().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
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
