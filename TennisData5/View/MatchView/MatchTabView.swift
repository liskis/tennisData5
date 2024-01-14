import SwiftUI
struct MatchTabView: View {
    @EnvironmentObject var pointInputModel:PointInputModel
    init() {
        let contentViewAp: UITabBarAppearance = UITabBarAppearance()
        contentViewAp.backgroundColor = .black
        UITabBar.appearance().scrollEdgeAppearance = contentViewAp
        UITabBar.appearance().standardAppearance = contentViewAp
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
        TabView {
            if pointInputModel.matchFormat == .singles {
                if pointInputModel.gameType == .pointGame {
                    SinglesPointGame().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else if pointInputModel.gameType == .setMatch {
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
                if pointInputModel.gameType == .pointGame {
                    DoublesPointGame().tabItem {
                        Text("ポイント入力")
                        Image(systemName: "hand.point.up")
                    }
                } else if pointInputModel.gameType == .setMatch {
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
            RealTimeData().tabItem {
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
