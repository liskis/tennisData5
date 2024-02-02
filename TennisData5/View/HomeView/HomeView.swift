import SwiftUI
struct HomeView: View {
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var homeDataVM: HomeDataViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing:0) {
                Spacer()
                HomeHeaderBar()
                ZStack {
                    VStack{
                        Image(.tennisCourt)
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    VStack{
                        Spacer().frame(height: 10)
                        StatsDataArea(homeDataVM: homeDataVM)
                        Spacer().frame(height: 40)
                        LineChartView(
                            data1: $homeDataVM.firstSvInChartData,
                            data2: $homeDataVM.secondSvInChartData
                        )
                        winLoseArrayArea
                        dateArrayArea
                        Spacer().frame(height: 10)
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                Spacer().frame(height: 5)
                                GameStartBtnsArea(homeDataVM: homeDataVM)
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
            ForEach(homeDataVM.firstSvInChartData){ data in
                if data.issue == .Win {
                    Text(data.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .white, radius: 2)
                } else if data.issue == .Lose {
                    Text(data.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .white, radius: 2)
                } else {
                    Text(data.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.gray)
                        .shadow(color: .white, radius: 2)
                }
                Spacer()
            }
        }
    }
    var dateArrayArea: some View {
        HStack{
            ForEach(homeDataVM.firstSvInChartData){ dataRow in
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


