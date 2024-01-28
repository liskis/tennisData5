import SwiftUI

struct ChartsLayOutArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width - 20
    var body: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Text("ファーストサーブの確率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.firstSvIn)
            Spacer().frame(height: 10)
            HStack{
                Text("セカンドサーブの確率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.firstSvIn)
            Spacer().frame(height: 10)
            HStack{
                Text("ダブルフォルトをしない確率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.noDoubleFault)
            Spacer().frame(height: 10)
            HStack{
                Text("ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atFirstSv)
            Spacer().frame(height: 10)
            HStack{
                Text("セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atSecondSv)
            Spacer().frame(height:10)
            ZStack{
                PieChartView(pieChartData: $chartDataVM.getAndLostPoint, styleScale: $chartDataVM.getAndLostPointStyleScale)
                Text("とったポイントと\nとられたポイント")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.02)
            }
            ZStack{
                PieChartView(pieChartData: $chartDataVM.keepAndBreak, styleScale: $chartDataVM.keepAndBreakStyleScale)
                Text("キープ率と\nブレーク率")
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                    .offset(y:chartWidth*0.02)
            }
            .offset(y:-chartWidth*0.15)
            
//            if matchInfoVM.matchFormat == .singles {
//                HStack{
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.winnerPoint,styleScale: $chartDataVM.styleScaleDis)
//                        Text("決めたポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.missPoint,styleScale: $chartDataVM.styleScaleDis)
//                        Text("ミスの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                }
//                .offset(y:-chartWidth*0.4)
//                HStack{
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.getPoint,styleScale: $chartDataVM.styleScaleDis)
//                        Text("とったポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.lostPoint,styleScale: $chartDataVM.styleScaleDis)
//                        Text("とられたポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                }
//                .offset(y:-chartWidth*0.8)
//            } else {
//                HStack{
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.winnerPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
//                        Text("決めたポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.missPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
//                        Text("ミスの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                }
//                .offset(y:-chartWidth*0.4)
//                HStack{
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.getPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
//                        Text("とったポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                    ZStack{
//                        PieChartView(pieChartData: $chartDataVM.lostPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
//                        Text("とられたポイントの内訳")
//                            .font(.custom("Verdana",size:6))
//                            .bold()
//                            .foregroundColor(.silver)
//                            .offset(y:chartWidth*0.03)
//                    }
//                }
//                .of5
            Spacer()
        }
        .padding(.horizontal,1)
//        .background{Color.white}
    }
}
