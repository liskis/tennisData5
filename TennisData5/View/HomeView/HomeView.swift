import SwiftUI
struct HomeView: View {
    @State var data1: [LineGraphDataModel] = HomeGraphData.data1
    @State var data2: [LineGraphDataModel] = HomeGraphData.data2
    @State var minAxis: Int = HomeGraphData.minAxis
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing:0) {
                Spacer()
                HomeHeaderBar()
                ZStack {
                    VStack{
                        Image("background2")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    VStack{
                        Spacer().frame(height: 10)
                        StatsDataArea()
                        Spacer().frame(height: 50)
                        HStack{
                            Spacer()
                            LineChartView(data1: $data1, data2: $data2, minAxis: $minAxis)
                            Spacer()
                        }
                        WinLoseArrayArea()
                        DateArrayArea()
                        Spacer().frame(height: 10)
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                Spacer().frame(height: 5)
                                GameStartBtnsArea()
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeTabView()
}


