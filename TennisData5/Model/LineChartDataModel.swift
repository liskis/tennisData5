
import Foundation
import SwiftUI

struct LineChartDataModel: Identifiable {
    
    var id: String = UUID().uuidString
    var num: Int
    var stats: Int
    var category: String
    var color: String
}
