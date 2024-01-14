import SwiftUI
import Charts

struct HomeGraphArea: View {
    var body: some View {
        Chart {
            ForEach(HomeGraphData.data1){ dataRow in
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
            ForEach(HomeGraphData.data2){ dataRow in
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
        .chartYScale(domain: [HomeGraphData.minAxis, 100])
        .chartLegend(.hidden)
    }
}

#Preview {
    HomeTabView()
}

