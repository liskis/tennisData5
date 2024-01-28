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
                    Label("ポイント入力", systemImage: "hand.point.up")
                }
            RealTimeDataView(pointVM: pointVM, matchInfoVM: matchInfoVM, chartDataVM: chartDataVM)
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("リアルタイムデータ", systemImage: "chart.bar.doc.horizontal")
                }
                .tabViewStyle(.automatic)
        }
        .accentColor(.white)
        .onAppear{
            matchInfoVM.matchFormat = matchFormat
            matchInfoVM.gameType = gameType
            matchInfoVM.naviTitle = naviTitle
        }
    }
}

