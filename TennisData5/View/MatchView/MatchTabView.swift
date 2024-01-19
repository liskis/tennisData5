import SwiftUI
struct MatchTabView: View {
    @Binding var matchFormat: MatchFormat
    @Binding var gameType: GameType
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var pointVM = PointViewModel()
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            TabView {
                PointGame(matchInfoVM: matchInfoVM, positionVM: positionVM, pointVM: pointVM).tabItem {
                    Text("ポイント入力")
                    Image(systemName: "hand.point.up")
                }
                RealTimeDataView(matchInfoVM: matchInfoVM, positionVM: positionVM, pointVM: pointVM).tabItem {
                    Text("リアルタイムデータ")
                    Image(systemName: "gauge.with.dots.needle.67percent")
                }
                .toolbarBackground(.black, for: .tabBar)
            }
           
        }
       
    }
}

