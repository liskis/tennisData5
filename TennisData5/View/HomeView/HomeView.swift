import SwiftUI
struct HomeView: View {
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var pointVM = PointViewModel()
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
                        Image(.background2)
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
                        winLoseArrayArea
                        dateArrayArea
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
    var winLoseArrayArea: some View {
        HStack{
            Spacer()
            ForEach(HomeGraphData.data1){ data in
                if data.issue == .Win {
                    Text("Win")
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .white, radius: 2)
                } else {
                    Text("Lose")
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .white, radius: 2)
                }
                Spacer()
            }
        }
    }
    var dateArrayArea: some View {
        HStack{
            ForEach(HomeGraphData.data1){ dataRow in
                Spacer()
                Text("\(dataRow.dateString)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Spacer()
        }
    }
}

