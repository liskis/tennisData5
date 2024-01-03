import Foundation
import SwiftUI

struct HomeGraphData: Identifiable {
    var id: String = UUID().uuidString
    var dateString: String
    var stats: Int
    var category: String
    
    static let firstServIn: [HomeGraphData] = [
        .init(dateString: "23/12/1", stats: 60, category: "1stServeIn"),
        .init(dateString: "23/12/8", stats: 63, category: "1stServeIn"),
        .init(dateString: "23/12/15", stats: 70, category: "1stServeIn"),
        .init(dateString: "23/12/16", stats: 70, category: "1stServeIn"),
        .init(dateString: "23/12/22", stats: 70, category: "1stServeIn")
    ]
    static let secondServeIn: [HomeGraphData] = [
        .init(dateString: "23/12/1", stats: 90, category: "2ndServeIn"),
        .init(dateString: "23/12/8", stats: 96, category: "2ndServeIn"),
        .init(dateString: "23/12/15", stats: 89, category: "2ndServeIn"),
        .init(dateString: "23/12/16", stats: 96, category: "2ndServeIn"),
        .init(dateString: "23/12/22", stats: 96, category: "2ndServeIn")
    ]
}
