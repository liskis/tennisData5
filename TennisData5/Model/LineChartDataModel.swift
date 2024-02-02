import Foundation
struct LineChartDataModel: Identifiable {
    var id: String = UUID().uuidString
    var num: Int
    var dateString: String
    var stats: Int
    var category: String
    var issue: Issue
}
