import SwiftUI
import Charts
struct BarChartView: View {
    @Binding var barChartData: [BarChartDataModel]
    var body: some View {
        Chart(barChartData) { dataRow in
            BarMark(
                x: .value("value", dataRow.value),
                y: .value("category", dataRow.category),
                width:10
            )
            .foregroundStyle(dataRow.color)
            RectangleMark(
                x: .value("index", dataRow.index),
                y: .value("category", dataRow.category),
                width:1,
                height: 10
            )
            .foregroundStyle(.red)
            .annotation(position: .bottom, alignment: .leading, spacing: 0) {
                Text(String(dataRow.index) + "%")
                    .foregroundColor(.gray)
                    .font(.custom("Verdana",size:8))
                    .bold()
            }
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
        .chartLegend(.hidden)
        .frame(height: 10)
    }
}

