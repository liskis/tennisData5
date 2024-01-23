import SwiftUI
struct OneMatchDataView: View {
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM = ChartDataViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Spacer(minLength: 20)
                    Text(dateFormatter(date:matchInfoVM.matchStartDate))
                        .font(.custom("Verdana",size:20))
                        .bold()
                        .foregroundColor(.tungsten)
                    Spacer(minLength: 10)
                    NameAndScoreArea(matchInfoVM: matchInfoVM, pointVM:pointVM)
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
                        Spacer().frame(height: 15)
                        HStack{
                            Text("キープ率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $chartDataVM.serviceGameKeep)
                        Spacer(minLength: 15)
                        HStack{
                            Text("ブレーク率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $chartDataVM.returnGameBreak)
                        Spacer(minLength: UIScreen.main.bounds.width/4)
                        if matchInfoVM.matchFormat == .singles {
                            HStack{
                                PieChartView(pieChartData: $chartDataVM.missCount,styleScale: $chartDataVM.styleScaleDis)
                                PieChartView(pieChartData: $chartDataVM.winnerCount,styleScale: $chartDataVM.styleScaleDis)
                            }.offset(y:-UIScreen.main.bounds.width/8)
                            HStack{
                                PieChartView(pieChartData: $chartDataVM.getPoint,styleScale: $chartDataVM.styleScaleDis)
                                PieChartView(pieChartData: $chartDataVM.lostPoint,styleScale: $chartDataVM.styleScaleDis)
                            }.offset(y:-UIScreen.main.bounds.width/4)
                        } else if matchInfoVM.matchFormat == .doubles {
                            HStack{
                                PieChartView(pieChartData: $chartDataVM.missCountDbls,styleScale: $chartDataVM.styleScaleDisDbls)
                                PieChartView(pieChartData: $chartDataVM.winnerCountDbls,styleScale: $chartDataVM.styleScaleDis)
                            }.offset(y:-UIScreen.main.bounds.width/8)
                            HStack{
                                PieChartView(pieChartData: $chartDataVM.getPoint,styleScale: $chartDataVM.styleScaleDis)
                                PieChartView(pieChartData: $chartDataVM.lostPoint,styleScale: $chartDataVM.styleScaleDis)
                            }.offset(y:-UIScreen.main.bounds.width/4)
                        }
                        Spacer()
                    }
                    .padding(.horizontal,10)
                    .background{Color.white}
                }
                .background{ Color.mercury }
            }
            .navigationBarTitle("マッチデータ", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }   
    }
}
extension OneMatchDataView{
    func dateFormatter(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        return dateFormatter.string(from: date)
    }
}
