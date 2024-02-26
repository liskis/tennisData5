
import SwiftUI

struct BarChartDataModel: Identifiable {
    
    var id: String = UUID().uuidString
    var value: Float
    var color: Color
    var category: String
    var index: Float
}
