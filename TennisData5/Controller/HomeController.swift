import Foundation
import SwiftUI
class HomeController{
    let data1: [LineGraphData] = [
        .init(dateString: "23/12/1", stats: 60, category: "data1"),
        .init(dateString: "23/12/8", stats: 63, category: "data1"),
        .init(dateString: "23/12/15", stats: 70, category: "data1"),
        .init(dateString: "23/12/16", stats: 70, category: "data1"),
        .init(dateString: "23/12/22", stats: 70, category: "data1")
    ]
    let data2: [LineGraphData] = [
        .init(dateString: "23/12/1", stats: 90, category: "data2"),
        .init(dateString: "23/12/8", stats: 96, category: "data2"),
        .init(dateString: "23/12/15", stats: 89, category: "data2"),
        .init(dateString: "23/12/16", stats: 96, category: "data2"),
        .init(dateString: "23/12/22", stats: 96, category: "data2")
    ]
    func minAxis(data1: [LineGraphData], data2: [LineGraphData]) -> Int{
        var minData: Int = 100
        for data in data1 {
            minData = data.stats < minData ? data.stats : minData
        }
        for data in data2 {
            minData = data.stats < minData ? data.stats : minData
        }
        return minData - 20
    }
}
