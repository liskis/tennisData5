import SwiftUI
import Charts
@available(iOS 17.0, *)
struct PieChartView: View {
    @Binding var pieChartData: [PieChartDataModel]
    @Binding var styleScale: KeyValuePairs<String, Color>
    let width = (UIScreen.main.bounds.width)/2 - 20
    var rowCount:Int = 0
    var body: some View {
        
            ZStack{
                VStack{
                    Spacer(minLength: 20)
                    Chart(pieChartData) { dataRow in
                        SectorMark(
                            angle: .value("value", dataRow.value),
                            angularInset: 1
                        )
                        .foregroundStyle(by: .value("name", dataRow.name))
                        .cornerRadius(4)
                    }
                    .chartPlotStyle { content in
                        content
                            .frame(width: width, height: width)
                    }
                    .rotationEffect(.degrees(270))
                    .chartLegend(.hidden)
                    .chartForegroundStyleScale(styleScale)
                    Spacer()
                }.frame(height: width)
                VStack{
                    Spacer(minLength: 20)
                    HStack{
                        Spacer()
                        ForEach(pieChartData) { datum in
                            if datum.name != "blank" {
                                if datum.textPsition == .low {
                                    VStack{
                                        Text(datum.nameString)
                                            .font(.custom("Verdana",size:10))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                        Text(String(datum.value))
                                            .font(.custom("Verdana",size:14))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                    }.offset(y: -20)
                                    Spacer()
                                } else if datum.textPsition == .highRight {
                                    VStack{
                                        Text(datum.nameString)
                                            .font(.custom("Verdana",size:10))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                        Text(String(datum.value))
                                            .font(.custom("Verdana",size:14))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                    }.offset(x: 20,y: -60)
                                    Spacer()
                                } else if datum.textPsition == .highLeft {
                                    VStack{
                                        Text(datum.nameString)
                                            .font(.custom("Verdana",size:10))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                        Text(String(datum.value))
                                            .font(.custom("Verdana",size:14))
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(color:.black,radius: 3)
                                    }.offset(x: -20,y: -60)
                                    Spacer()
                                }
                            }
                        }
                    }
                    Spacer()
                }.frame(height: width)
            } .frame(height: width)
    }
}


