import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    @Binding var naviTitle: String
    @ObservedObject var matchVM = MatchViewModel()
    var body: some View {
        TabView {
            PointGame(matchVM: matchVM)
                .toolbarBackground(.black, for: .tabBar)
                .tabItem {
                    Text("ポイント入力")
                    Image(systemName: "hand.point.up")
                }
            RealTimeDataView(matchVM: matchVM)
                .toolbarBackground(.black, for: .tabBar)
                .tabItem {
                    Text("リアルタイムデータ")
                    Image(systemName: "gauge.with.dots.needle.67percent")
                }
        }
        .accentColor(.white)
        .onAppear{
            matchVM.matchInfoVM.matchFormat = matchFormat
            matchVM.matchInfoVM.gameType = gameType
            matchVM.matchInfoVM.naviTitle = naviTitle
        }
    }
}

