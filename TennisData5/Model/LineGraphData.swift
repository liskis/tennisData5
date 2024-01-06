import Foundation
struct LineGraphData: Identifiable {
    var id: String = UUID().uuidString
    var dateString: String
    var stats: Int
    var category: String
}
