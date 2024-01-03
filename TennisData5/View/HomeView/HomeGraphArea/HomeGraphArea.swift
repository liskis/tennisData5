import SwiftUI
import Charts

struct HomeGraphArea: View {
    func minAxis() -> Int{
        var minData: Int = 100
        for data in HomeGraphData.firstServIn {
            minData = data.stats < minData ? data.stats : minData
        }
        for data in HomeGraphData.secondServeIn {
            minData = data.stats < minData ? data.stats : minData
        }
        return minData - 10
    }
    var body: some View {
        Chart {
            ForEach(HomeGraphData.firstServIn){ dataRow in
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
            ForEach(HomeGraphData.secondServeIn){ dataRow in
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
            "1stServeIn": .orange,
            "2ndServeIn": .red
        ])
        .chartSymbolScale([
            "1stServeIn": Circle().strokeBorder(lineWidth: 5),
            "2ndServeIn": Circle().strokeBorder(lineWidth: 5)
        ])
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: [minAxis(), 100])
        .chartLegend(.hidden)
    }
}

#Preview {
    ContentView()
}

