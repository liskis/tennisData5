import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    @Binding var naviTitle: String
    @ObservedObject var dataManageVM = DataManageViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    @ObservedObject var homeDataVM: HomeDataViewModel
    var body: some View {
        TabView {
            PointGame(dataManageVM: dataManageVM,
                      pointVM: dataManageVM.pointVM,
                      matchInfoVM: dataManageVM.matchInfoVM,
                      positionVM: dataManageVM.positionVM,
                      chartDataVM: chartDataVM,
                      homeDataVM: homeDataVM)
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("ポイント入力", systemImage: "hand.point.up")
                }
            RealTimeDataView(pointVM: dataManageVM.pointVM,
                             matchInfoVM: dataManageVM.matchInfoVM,
                             chartDataVM: chartDataVM)
                .toolbarBackground(.black, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tabItem {
                    Label("リアルタイムデータ", systemImage: "chart.bar.doc.horizontal")
                }
                .tabViewStyle(.automatic)
        }
        .accentColor(.white)
        .onAppear{
            dataManageVM.matchInfoVM.matchFormat = matchFormat
            dataManageVM.matchInfoVM.gameType = gameType
            dataManageVM.matchInfoVM.naviTitle = naviTitle
        }
    }
}

