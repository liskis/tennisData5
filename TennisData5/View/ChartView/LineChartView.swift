import SwiftUI
import Charts
struct LineChartView: View {
    @Binding var data1: [LineChartDataModel]
    @Binding var data2: [LineChartDataModel]
    @Binding var data3: [LineChartDataModel]
    var body: some View {
        Chart {
            ForEach(data3) { dataRow in
                LineMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Category", dataRow.category))
            }
            ForEach(data1){ dataRow in
                LineMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Category", dataRow.category))
                .lineStyle(StrokeStyle(lineWidth: 5))
                PointMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .annotation(position: .bottom, alignment: .leading, spacing: 0) {
                    Text(String(dataRow.stats) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:17))
                        .bold()
                        .shadow(color: .black, radius: 5)
                }
                .foregroundStyle(by: .value("Category", dataRow.category))
                .symbol(by: .value("Category", dataRow.category))
                .symbolSize(100)
            }
            ForEach(data2){ dataRow in
                LineMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Category", dataRow.category))
                .lineStyle(StrokeStyle(lineWidth: 5))
                PointMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .annotation(position: .top, alignment: .trailing, spacing: 0) {
                    Text(String(dataRow.stats) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:17))
                        .bold()
                        .shadow(color: .black, radius: 5)
                }
                .foregroundStyle(by: .value("Category", dataRow.category))
                .symbol(by: .value("Category", dataRow.category))
                .symbolSize(100)
            }
        }
        .frame(height: 180)
        .chartForegroundStyleScale([
            "data1": .orange,
            "data2": .red,
            "data3": .clear
        ])
        .chartSymbolScale([
            "data1": Circle().strokeBorder(lineWidth: 5),
            "data2": Circle().strokeBorder(lineWidth: 5)
        ])
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: [minAxis, 100])
        .chartXScale(domain: [0,data3.count - 1])
        .chartLegend(.hidden)
        .padding(.horizontal,40)
//        .background(Color.black)
    }
}
extension LineChartView {
    var minAxis: Double {
        var minData: Int = 100
        for data in data1 {
                minData = data.stats < minData ? data.stats : minData
            
        }
        for data in data2 {
                minData = data.stats < minData ? data.stats : minData
            
        }
        return Double(minData) - Double(20)
    }
}
