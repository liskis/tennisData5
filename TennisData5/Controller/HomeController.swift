import Foundation
import SwiftUI
class HomeController{
   
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
