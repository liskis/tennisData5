import SwiftUI

struct ChartsLayOutArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width / 2 - 20
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
            BarChartView(barChartData: $chartDataVM.firstSvIn)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.secondSvInCount)）セカンドサーブの確率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.secondSvIn)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.doubleFaultCount)）ダブルフォルトの確率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.doubleFault)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atFirstSvCount)）ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atFirstSv)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atSecondSvCount)）セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atSecondSv)
            Spacer().frame(height:50)
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
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                    .offset(y:chartWidth*0.03)
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
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                    .offset(y:chartWidth*0.03)
            }
            
            
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
                    .font(.custom("Verdana",size:9))
                    .bold()
                    .foregroundColor(.tungsten)
                    .offset(y:chartWidth*0.03)
            }
            
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
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                    .offset(y:chartWidth*0.03)
            }
            
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
                        .font(.custom("Verdana",size:9))
                        .bold()
                        .foregroundColor(.tungsten)
                        .offset(y:chartWidth*0.03)
                }
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
                        .font(.custom("Verdana",size:9))
                        .bold()
                        .foregroundColor(.tungsten)
                        .offset(y:chartWidth*0.03)
                }
            
               
            }
            Spacer()
        }
        .padding(.horizontal,10)
    }
}
