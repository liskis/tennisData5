
import SwiftUI

struct PieChartDataModel: Identifiable {

    var id = UUID().uuidString
    var name: String
    var nameString: String
    var value: Double
    var labelType: LabelType
}
