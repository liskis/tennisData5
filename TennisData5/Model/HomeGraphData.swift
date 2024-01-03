import Foundation
import SwiftUI

struct HomeGraphData: Identifiable {
    var id: String = UUID().uuidString
    var dateString: String
    var stats: Int
    var category: String
}
