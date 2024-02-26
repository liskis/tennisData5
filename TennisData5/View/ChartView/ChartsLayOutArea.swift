
import SwiftUI

struct ChartsLayOutArea: View {
    
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = UIScreen.main.bounds.width/2 - 20
    
    var body: some View {
        VStack{
            Spacer().frame(height: 10)
            firstSvInArea
            Spacer().frame(height: 20)
            secondSvInArea
            Spacer().frame(height: 20)
            doublefaultArea
            Spacer().frame(height: 20)
            atFirstSvInArea
            Spacer().frame(height: 20)
            atSecondSvInArea
            Spacer().frame(height:50)
            HStack{
                getAndLostPointArea
                keepAndBreakArea
            }
            HStack{
                pointRateByServiceSideArea
                pointRateByReturnSideArea
            }
            .offset(y:-chartWidth*0.4)
            if matchInfoVM.matchFormat == .singles {
                ZStack{
                    HStack{
                        winnerPointArea
                        missPointArea
                    }
                    waitForUpdate
                }
                .offset(y:-chartWidth*0.8)
                ZStack{
                    HStack{
                        getPointArea
                        lostPointArea
                    }
                    waitForUpdate
                }
                .offset(y:-chartWidth*1.2)
            } else {
                HStack{
                    pointRateBySvOrVolyArea
                    pointRateByRetOrVolyArea
                }
                .offset(y:-chartWidth*0.8)
                ZStack{
                    HStack{
                        winnerPointDblsArea
                        missPointDblsArea
                    }
                    waitForUpdate
                }
                .offset(y:-chartWidth*1.2)
                ZStack{
                    HStack{
                        getPointDblsArea
                        lostPointDblsArea
                    }
                    waitForUpdate
                }
                .offset(y:-chartWidth*1.6)
            }
            Spacer()
        }
        .padding(.horizontal,10)
        .background{Color.white}
    }
    
    private var firstSvInArea: some View {
        VStack{
            HStack{
                Text("（\(chartDataVM.firstSvInCount)）ファーストサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.firstSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.firstSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var secondSvInArea: some View {
        VStack{
            HStack{
                Text("（\(chartDataVM.secondSvInCount)）セカンドサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.secondSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.secondSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var doublefaultArea: some View {
        VStack{
            HStack{
                Text("（\(chartDataVM.doubleFaultCount)）ダブルフォルトの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.doubleFault)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.doubleFault[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var atFirstSvInArea: some View {
        VStack {
            HStack{
                Text("（\(chartDataVM.atFirstSvCount)）ファーストサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atFirstSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atFirstSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var atSecondSvInArea: some View {
        VStack {
            HStack{
                Text("（\(chartDataVM.atSecondSvCount)）セカンドサーブ時のポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.tungsten)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atSecondSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atSecondSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var getAndLostPointArea: some View {
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
    }
    
    private var keepAndBreakArea: some View {
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
    
    private var pointRateByServiceSideArea: some View {
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
    }
    
    private var pointRateByReturnSideArea: some View {
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
    
    private var winnerPointArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.winnerPoint,
                styleScale: $chartDataVM.styleScaleDis
            )
            Text("決めたポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var missPointArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.missPoint,
                styleScale: $chartDataVM.styleScaleDis
            )
            Text("ミスの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var getPointArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.getPoint,
                styleScale: $chartDataVM.styleScaleDis
            )
            Text("とったポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var lostPointArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.lostPoint,
                styleScale: $chartDataVM.styleScaleDis
            )
            Text("とられたポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var waitForUpdate: some View {
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
    
    private var pointRateBySvOrVolyArea: some View {
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
    }
    
    private var pointRateByRetOrVolyArea: some View {
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
    
    private var winnerPointDblsArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.winnerPointDbls,
                styleScale: $chartDataVM.styleScaleDisDbls
            )
            Text("決めたポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var missPointDblsArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.missPointDbls,
                styleScale: $chartDataVM.styleScaleDisDbls
            )
            Text("ミスの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var getPointDblsArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.getPointDbls,
                styleScale: $chartDataVM.styleScaleDisDbls
            )
            Text("とったポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
    
    private var lostPointDblsArea: some View {
        ZStack{
            PieChartView(
                pieChartData: $chartDataVM.lostPointDbls,
                styleScale: $chartDataVM.styleScaleDisDbls
            )
            Text("とられたポイントの内訳")
                .font(.custom("Verdana",size:10))
                .bold()
                .foregroundColor(.silver)
                .offset(y:chartWidth*0.03)
        }
    }
}
