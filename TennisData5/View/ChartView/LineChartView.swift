
import SwiftUI
import Charts

struct LineChartView: View {
    
    @Binding var valueData: [LineChartDataModel]
    @Binding var signPost: [LineChartDataModel]
    
    var body: some View {
        Chart {
            // 値が存在しないときに表示しない設定用
            ForEach(signPost) { dataRow in
                LineMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Color", dataRow.color))
            }
            ForEach(valueData){ dataRow in
                // 棒グラフ
                LineMark(
                    x: .value("num", dataRow.num),
                    y: .value("Stats", dataRow.stats)
                )
                .foregroundStyle(by: .value("Color", dataRow.color))
                .lineStyle(StrokeStyle(lineWidth: 5))
                .annotation(position: .top, alignment: .leading, spacing: 5) {
                    Text(String(dataRow.category))
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:15))
                        .shadow(color: .black, radius: 5)
                }
                // 点グラフと値の表示
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
                .foregroundStyle(by: .value("Color", dataRow.color))
                .symbol(by: .value("Color", dataRow.color))
                .symbolSize(100)
            }
        }
        .frame(height: 100)
        .chartForegroundStyleScale([
            "orange": .orange,
            "red": .red,
            "clear": .clear
        ])
        .chartSymbolScale([
            "orange": Circle().strokeBorder(lineWidth: 5),
            "red": Circle().strokeBorder(lineWidth: 5)
        ])
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartYScale(domain: [minAxis, maxAxis])
        .chartXScale(domain: [0,signPost.count - 1])
        .chartLegend(.hidden)
        .padding(.horizontal,40)
    }
}

extension LineChartView {
    // 最大表示域
    var maxAxis: Int {
        var maxData: Int = 0
        for data in valueData {
            maxData = data.stats > maxData ? data.stats : maxData
        }
        return maxData + 40
    }
    // 最小表示域
    var minAxis: Int {
        var minData: Int = 100
        for data in valueData {
            minData = data.stats < minData ? data.stats : minData
        }
        return minData - 50
    }
}
