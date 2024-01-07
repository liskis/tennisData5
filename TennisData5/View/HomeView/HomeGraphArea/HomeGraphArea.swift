import SwiftUI
import Charts

struct HomeGraphArea: View {
    @Binding var data1: [LineGraphData]
    @Binding var data2: [LineGraphData]
    let ctl = HomeController()
    var body: some View {
        Chart {
            ForEach(data1){ dataRow in
                LineMark(
                    x: .value("日付", dataRow.dateString),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Category", dataRow.category))
                .lineStyle(StrokeStyle(lineWidth: 5))
                PointMark(
                    x: .value("日付", dataRow.dateString),
                    y: .value("Stats", dataRow.stats)
                )
                .annotation(position: .bottomTrailing, alignment: .trailing, spacing: 0) {
                    Text(String(dataRow.stats) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .shadow(radius: 10)
                }
                .foregroundStyle(by: .value("Category", dataRow.category))
                .symbol(by: .value("Category", dataRow.category))
                .symbolSize(100)
            }
            ForEach(data2){ dataRow in
                LineMark(
                    x: .value("日付", dataRow.dateString),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Category", dataRow.category))
                .lineStyle(StrokeStyle(lineWidth: 5))
                PointMark(
                    x: .value("日付", dataRow.dateString),
                    y: .value("Stats", dataRow.stats)
                )
                .annotation(position: .topLeading, alignment: .trailing, spacing: 0) {
                    Text(String(dataRow.stats) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .shadow(radius: 10)
                }
                .foregroundStyle(by: .value("Category", dataRow.category))
                .symbol(by: .value("Category", dataRow.category))
                .symbolSize(100)
            }
        }
        .frame(height: 200)
        .chartForegroundStyleScale([
            "data1": .orange,
            "data2": .red
        ])
        .chartSymbolScale([
            "data1": Circle().strokeBorder(lineWidth: 5),
            "data2": Circle().strokeBorder(lineWidth: 5)
        ])
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: [ctl.minAxis(data1: data1, data2: data2), 100])
        .chartLegend(.hidden)
    }
}

#Preview {
    HomeTabView()
}

