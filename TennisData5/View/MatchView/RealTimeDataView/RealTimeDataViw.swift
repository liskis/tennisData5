import SwiftUI
import Charts
struct RealTimeDataView: View {
    @ObservedObject var matchInfoVM:MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    @State var firstSvIn: [BarChartDataModel] = RealTimeData.firstSvIn
    @State var secondSvIn: [BarChartDataModel] = RealTimeData.secondSvIn
    @State var atFirstSv: [BarChartDataModel] = RealTimeData.atFirstSv
    @State var atSecondSv: [BarChartDataModel] = RealTimeData.atSecondSv
    @State var serviceGameKeep: [BarChartDataModel] = RealTimeData.serviceGameKeep
    @State var returnGameBreak: [BarChartDataModel] = RealTimeData.returnGameBreak
    @State var getAndLostPoint: [PieChartDataModel] = RealTimeData.getAndLostPoint
    @State var missCount: [PieChartDataModel] = RealTimeData.missCount
    var body: some View {
        NavigationStack{
            VStack{
                Spacer().frame(height: 20)
                MyNameAndScoreArea(matchInfoVM: matchInfoVM, pointVM: pointVM)
                Spacer().frame(height: 20)
                HStack{
                    Spacer().frame(width: 10)
                    VStack{
                        Spacer().frame(height: 10)
                        HStack{
                            Text("ファーストサーブの確率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $firstSvIn)
                        Spacer().frame(height: 15)
                        HStack{
                            Text("セカンドサーブの確率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $secondSvIn)
                        Spacer().frame(height: 15)
                        HStack{
                            Text("ファーストサーブ時のポイント取得率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $atFirstSv)
                        Spacer().frame(height: 15)
                        HStack{
                            Text("セカンドサーブ時のポイント取得率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $atSecondSv)
                        Spacer().frame(height: 15)
                        HStack{
                            Text("キープ率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $serviceGameKeep)
                        Spacer().frame(height: 15)
                        HStack{
                            Text("ブレーク率")
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.tungsten)
                            Spacer()
                        }
                        BarChartView(barChartData: $returnGameBreak)
                        Spacer().frame(height: 15)
                        HStack{
                            PieChartView(pieChartData: $getAndLostPoint)
                            Spacer()
                        }
                        HStack{
                            PieChartView(pieChartData: $missCount)
                        }
                        
                    }
                    Spacer().frame(width: 10)
                }
                .background{Color.white}
            }
            .background{ Color.mercury }
            .navigationBarTitle("リアルタイムデータ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

