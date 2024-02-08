import SwiftUI

struct ChartsLayOutArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = UIScreen.main.bounds.width/2 - 20
    var body: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Text("（\(chartDataVM.firstSvInCount)）ファーストサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.firstSvIn)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.secondSvInCount)）セカンドサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.secondSvIn)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.noDoubleFaultCount)）ダブルフォルトをしない確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.noDoubleFault)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atFirstSvCount)）ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atFirstSv)
            Spacer().frame(height: 20)
            HStack{
                Text("（\(chartDataVM.atSecondSvCount)）セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            BarChartView(barChartData: $chartDataVM.atSecondSv)
            Spacer().frame(height:50)
            HStack{
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
            }
            
            HStack{
                ZStack{
                    if chartDataVM.pointRateBySvOrVoly[2].nameString == "init" {
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
            }
            .offset(y:-chartWidth*0.4)
            
            if matchInfoVM.matchFormat == .singles {
                ZStack{
                    HStack{
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.winnerPoint,styleScale: $chartDataVM.styleScaleDis)
                            Text("決めたポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.missPoint,styleScale: $chartDataVM.styleScaleDis)
                            Text("ミスの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                    }
                    Text("Please wait for update !")
                        .frame(width: 180,height: 20)
                        .bold()
                        .italic()
                        .font(.custom("Verdana", size: 12))
                        .foregroundColor(.red)
                        .background(Color.yellow)
                        .rotationEffect(.degrees(-10))
                        .offset(y:-chartWidth*0.3)
                }
                .offset(y:-chartWidth*0.8)
                ZStack{
                    HStack{
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.getPoint,styleScale: $chartDataVM.styleScaleDis)
                            Text("とったポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.lostPoint,styleScale: $chartDataVM.styleScaleDis)
                            Text("とられたポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                    }
                    Text("Please wait for update !")
                        .frame(width: 180,height: 20)
                        .bold()
                        .italic()
                        .font(.custom("Verdana", size: 12))
                        .foregroundColor(.red)
                        .background(Color.yellow)
                        .rotationEffect(.degrees(-10))
                        .offset(y:-chartWidth*0.3)
                }
                .offset(y:-chartWidth*1.2)
            } else {
                HStack{
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
                .offset(y:-chartWidth*0.8)
                ZStack{
                    HStack{
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.winnerPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                            Text("決めたポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.missPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                            Text("ミスの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                    }
                    Text("Please wait for update !")
                        .frame(width: 180,height: 20)
                        .bold()
                        .italic()
                        .font(.custom("Verdana", size: 12))
                        .foregroundColor(.red)
                        .background(Color.yellow)
                        .rotationEffect(.degrees(-10))
                        .offset(y:-chartWidth*0.3)
                }
                .offset(y:-chartWidth*1.2)
                ZStack{
                    HStack{
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.getPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                            Text("とったポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                        ZStack{
                            PieChartView(pieChartData: $chartDataVM.lostPointDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                            Text("とられたポイントの内訳")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.silver)
                                .offset(y:chartWidth*0.03)
                        }
                    }
                    Text("Please wait for update !")
                        .frame(width: 180,height: 20)
                        .bold()
                        .italic()
                        .font(.custom("Verdana", size: 12))
                        .foregroundColor(.red)
                        .background(Color.yellow)
                        .rotationEffect(.degrees(-10))
                        .offset(y:-chartWidth*0.3)
                }
                .offset(y:-chartWidth*1.6)
            }
            Spacer()
        }
        .padding(.horizontal,10)
        .background{Color.white}
    }
}
