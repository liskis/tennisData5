import Foundation
class LineGraphDataPass: ObservableObject {
    @Published var data1: [LineGraphData] = []
    @Published var data2: [LineGraphData] = []
    var lineGraphData1: [LineGraphData] {
        get{ data1 }
    }
    var lineGraphData2: [LineGraphData] {
        get{ data2 }
    }
    func minAxis() -> Int{
        var minData: Int = 100
        for data in data1 {
            minData = data.stats < minData ? data.stats : minData
        }
        for data in data2 {
            minData = data.stats < minData ? data.stats : minData
        }
        return minData - 10
    }
}
