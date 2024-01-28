import Foundation
struct LineChartDataModel: Identifiable {
    var id: String = UUID().uuidString
    var dateString: String
    var stats: Int
    var category: String
    var issue: Issue
}
