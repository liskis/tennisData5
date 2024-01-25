import SwiftUI

struct ChartsLayOutArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = UIScreen.main.bounds.width/2 - 20
    var body: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Text("ファーストサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.firstSvIn)
            Spacer().frame(height: 15)
            HStack{
                Text("セカンドサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.secondSvIn)
            Spacer().frame(height: 15)
            HStack{
                Text("ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atFirstSv)
            Spacer().frame(height: 15)
            HStack{
                Text("セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atSecondSv)
            Spacer().frame(height:40)
            HStack{
                PieChartView(pieChartData: $chartDataVM.getAndLostPoint, styleScale: $chartDataVM.getAndLostPointStyleScale)
                PieChartView(pieChartData: $chartDataVM.keepAndBreak, styleScale: $chartDataVM.keepAndBreakStyleScale)
            }
            if matchInfoVM.matchFormat == .singles {
                HStack{
                    PieChartView(pieChartData: $chartDataVM.missPoint,styleScale: $chartDataVM.styleScaleDis)
                    PieChartView(pieChartData: $chartDataVM.winnerPoint,styleScale: $chartDataVM.styleScaleDis)
                }
                .offset(y:-chartWidth*0.4)
                HStack{
                    PieChartView(pieChartData: $chartDataVM.getPoint,styleScale: $chartDataVM.styleScaleDis)
                    PieChartView(pieChartData: $chartDataVM.lostPoint,styleScale: $chartDataVM.styleScaleDis)
                }
                .offset(y:-chartWidth*0.8)
            } else if matchInfoVM.matchFormat == .doubles {
                HStack{
                    PieChartView(pieChartData: $chartDataVM.winnerPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                    PieChartView(pieChartData: $chartDataVM.missPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                }
                .offset(y:-chartWidth*0.4)
                HStack{
                    PieChartView(pieChartData: $chartDataVM.getPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                    PieChartView(pieChartData: $chartDataVM.lostPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                }
                .offset(y:-chartWidth*0.8)
            }
            Spacer()
        }
        .padding(.horizontal,10)
        .background{Color.white}
    }
}
