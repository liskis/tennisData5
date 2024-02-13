import SwiftUI

struct ChartsLayOutArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width / 2
    var body: some View {       
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Text("（\(chartDataVM.firstSvInCount)）ファーストサーブの確率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.firstSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.firstSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:8))
                        .bold()
                    Spacer()
                }
            }
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.secondSvInCount)）セカンドサーブの確率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.secondSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.secondSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:8))
                        .bold()
                    Spacer()
                }
            }
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.doubleFaultCount)）ダブルフォルトの確率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.doubleFault)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.doubleFault[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:8))
                        .bold()
                    Spacer()
                }
            }
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atFirstSvCount)）ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atFirstSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atFirstSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:8))
                        .bold()
                    Spacer()
                }
            }
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atSecondSvCount)）セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atSecondSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atSecondSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:8))
                        .bold()
                    Spacer()
                }
            }
            Spacer().frame(height:20)
            ZStack{
                if chartDataVM.getAndLostPoint[2].nameString == "init" {
                    PieChartView(
                        pieChartData: $chartDataVM.getAndLostPoint,
                        styleScale: $chartDataVM.styleScaleDis
                    )
                } else {
                    PieChartView(
                        pieChartData: $chartDataVM.getAndLostPoint,
                        styleScale: $chartDataVM.getAndLostPointStyleScale
                    )
                }
                Text("とったポイントと取られたポイント")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.1)
            }
            ZStack{
                if chartDataVM.keepAndBreak[2].nameString == "init"{
                    PieChartView(
                        pieChartData: $chartDataVM.keepAndBreak,
                        styleScale: $chartDataVM.keepAndBreakStyleScaleDis
                    )
                } else {
                    PieChartView(
                        pieChartData: $chartDataVM.keepAndBreak,
                        styleScale: $chartDataVM.keepAndBreakStyleScale
                    )
                }
                Text("キープ率とブレーク率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.1)
            }
            .offset(y:-chartWidth*0.2)
            ZStack{
                if chartDataVM.pointRateByServiceSide[2].nameString == "init" {
                    PieChartView(
                        pieChartData: $chartDataVM.pointRateByServiceSide,
                        styleScale: $chartDataVM.styleScaleDis
                    )
                } else {
                    PieChartView(
                        pieChartData: $chartDataVM.pointRateByServiceSide,
                        styleScale: $chartDataVM.pointRateStyleScale
                    )
                }
                Text("サービスサイドのポイント取得率")
                    .font(.custom("Verdana",size:7))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.1)
            }
            .offset(y:-chartWidth*0.4)
            ZStack{
                if chartDataVM.pointRateByReturnSide[2].nameString == "init"{
                    PieChartView(
                        pieChartData: $chartDataVM.pointRateByReturnSide,
                        styleScale: $chartDataVM.styleScaleDis
                    )
                } else {
                    PieChartView(
                        pieChartData: $chartDataVM.pointRateByReturnSide,
                        styleScale: $chartDataVM.pointRateStyleScale
                    )
                }
                Text("リターンサイドのポイント取得率")
                    .font(.custom("Verdana",size:7))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.1)
            }
            .offset(y:-chartWidth*0.6)
            if matchInfoVM.matchFormat == .doubles {
                ZStack{
                    if chartDataVM.pointRateBySvOrVoly[2].nameString == "init" {
                        PieChartView(
                            pieChartData: $chartDataVM.pointRateBySvOrVoly,
                            styleScale: $chartDataVM.styleScaleDis
                        )
                    } else {
                        PieChartView(
                            pieChartData: $chartDataVM.pointRateBySvOrVoly,
                            styleScale: $chartDataVM.pointRateStyleScale
                        )
                    }
                    Text("サーバーとボレーヤーのポイント取得率")
                        .font(.custom("Verdana",size:7))
                        .bold()
                        .foregroundColor(.white)
                        .offset(y:chartWidth*0.1)
                }
                .offset(y:-chartWidth*0.8)
                ZStack{
                    if chartDataVM.pointRateByReturnSide[2].nameString == "init"{
                        PieChartView(
                            pieChartData: $chartDataVM.pointRateByRetOrVoly,
                            styleScale: $chartDataVM.styleScaleDis
                        )
                    } else {
                        PieChartView(
                            pieChartData: $chartDataVM.pointRateByRetOrVoly,
                            styleScale: $chartDataVM.pointRateStyleScale
                        )
                    }
                    Text("リターナーとボレーヤーのポイント取得率")
                        .font(.custom("Verdana",size:7))
                        .bold()
                        .foregroundColor(.white)
                        .offset(y:chartWidth*0.1)
                }
                .offset(y:-chartWidth)
            }
        }
        .padding(.horizontal,10)
    }
}
