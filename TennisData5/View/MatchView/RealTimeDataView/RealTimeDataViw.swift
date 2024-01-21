import SwiftUI
import Charts
struct RealTimeDataView: View {
    @ObservedObject var matchVM: MatchViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Text("リアルタイムデータ")
                    .font(.custom("Verdana",size:15))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                ScrollView {
                    VStack{
                        Spacer(minLength: 20)
                        MyNameAndScoreArea(matchInfoVM: matchVM.matchInfoVM, pointVM: matchVM.pointVM)
                        Spacer(minLength: 20)
                        VStack{
                            Spacer().frame(height: 10)
                            HStack{
                                Text("ファーストサーブの確率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.firstSvIn)
                            Spacer().frame(height: 15)
                            HStack{
                                Text("セカンドサーブの確率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.secondSvIn)
                            Spacer().frame(height: 15)
                            HStack{
                                Text("ファーストサーブ時のポイント取得率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.atFirstSv)
                            Spacer().frame(height: 15)
                            HStack{
                                Text("セカンドサーブ時のポイント取得率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.atSecondSv)
                            Spacer().frame(height: 15)
                            HStack{
                                Text("キープ率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.serviceGameKeep)
                            Spacer(minLength: 15)
                            HStack{
                                Text("ブレーク率")
                                    .font(.custom("Verdana",size:10))
                                    .bold()
                                    .foregroundColor(.tungsten)
                                Spacer()
                            }
                            BarChartView(barChartData: $matchVM.returnGameBreak)
                            Spacer(minLength: UIScreen.main.bounds.width/4)
                            if matchVM.matchInfoVM.matchFormat == .singles {
                                HStack{
                                    PieChartView(pieChartData: $matchVM.missCount,styleScale: $matchVM.styleScaleDis)
                                    PieChartView(pieChartData: $matchVM.winnerCount,styleScale: $matchVM.styleScaleDis)
                                }.offset(y:-UIScreen.main.bounds.width/8)
                                HStack{
                                    PieChartView(pieChartData: $matchVM.getPoint,styleScale: $matchVM.styleScaleDis)
                                    PieChartView(pieChartData: $matchVM.lostPoint,styleScale: $matchVM.styleScaleDis)
                                }.offset(y:-UIScreen.main.bounds.width/4)
                            } else if matchVM.matchInfoVM.matchFormat == .doubles {
                                HStack{
                                    PieChartView(pieChartData: $matchVM.missCountDbls,styleScale: $matchVM.styleScaleDisDbls)
                                    PieChartView(pieChartData: $matchVM.winnerCountDbls,styleScale: $matchVM.styleScaleDis)
                                }.offset(y:-UIScreen.main.bounds.width/8)
                                HStack{
                                    PieChartView(pieChartData: $matchVM.getPoint,styleScale: $matchVM.styleScaleDis)
                                    PieChartView(pieChartData: $matchVM.lostPoint,styleScale: $matchVM.styleScaleDis)
                                }.offset(y:-UIScreen.main.bounds.width/4)
                            }
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .background{Color.white}
                    }
                    .background{ Color.mercury }
                }
            }
        }
    }
}

