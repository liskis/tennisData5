import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    @Binding var naviTitle: String
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    var body: some View {
        TabView {
            PointGame(pointVM: pointVM, matchInfoVM: matchInfoVM, positionVM: positionVM, chartDataVM: chartDataVM)
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Text("ポイント入力")
                    Image(systemName: "hand.point.up")
                }
            RealTimeDataView(pointVM: pointVM, matchInfoVM: matchInfoVM, chartDataVM: chartDataVM)
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Text("リアルタイムデータ")
                    Image(systemName: "gauge.with.dots.needle.67percent")
                }
        }
        .accentColor(.white)
        .onAppear{
            matchInfoVM.matchFormat = matchFormat
            matchInfoVM.gameType = gameType
            matchInfoVM.naviTitle = naviTitle
        }
    }
}

