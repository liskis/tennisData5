import Foundation
import SwiftUI
import RealmSwift
class ChartDataViewModel: ObservableObject {
    @Published var firstSvInCount: String = "No Data"
    @Published var firstSvIn: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "firstSvIn", index: 60),
        .init(value: 100, color: .mercury, category: "firstSvIn", index: 60)
    ]
    @Published var secondSvInCount: String = "No Data"
    @Published var secondSvIn: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "secondSvIn", index: 80),
        .init(value: 100, color: .mercury, category: "secondSvIn", index: 80)
    ]
    @Published var noDoubleFaultCount: String = "No Data"
    @Published var noDoubleFault: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "noDoubleFault", index: 92),
        .init(value: 100, color: .mercury, category: "noDoubleFault", index: 92)
    ]
    @Published var atFirstSvCount: String = "No Data"
    @Published var atFirstSv: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "atFirstSv", index: 60),
        .init(value: 100, color: .mercury, category: "atFirstSv", index: 60)
    ]
    @Published var atSecondSvCount: String = "No Data"
    @Published var atSecondSv: [BarChartDataModel] = [
        .init(value: 0, color: .blue, category: "atSecondSv", index: 50),
        .init(value: 100, color: .mercury, category: "atSecondSv", index: 50)
    ]
    
    @Published var getAndLostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "とった\nポイント", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "とられた\nポイント", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var getAndLostPointStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .tangerine, "blank": .white
    ]
    @Published var keepAndBreak: [PieChartDataModel] = [
        .init(name: "data1", nameString: "キープ率", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ブレーク率", value: 1, labelType: .twoLabels),
        
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var keepAndBreakStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .aqua, "blank": .white
    ]
    @Published var pointRateBySvOrVoly: [PieChartDataModel] = [
        .init(name: "data1", nameString: "サーバー", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByRetOrVoly: [PieChartDataModel] = [
        .init(name: "data1", nameString: "リターナー", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "ボレーヤー", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByServiceSide: [PieChartDataModel] = [
        .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateByReturnSide: [PieChartDataModel] = [
        .init(name: "data1", nameString: "フォア\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "バック\nサイド", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var pointRateStyleScale: KeyValuePairs<String, Color> = [
        "data1": .blue, "data2": .aqua, "blank": .white
    ]
    
    @Published var keepAndBreakStyleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "data3": .silver, "data4": .silver ,"blank": .white
    ]
    @Published var winnerPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var missPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var getPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    @Published var lostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "init", value: 2, labelType: .twoLabels)
    ]
    
    @Published var styleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "blank": .white
    ]
    
    @Published var winnerPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手が\n決めた", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var missPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "味方の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var getPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手の\nミス", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var lostPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "init", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var styleScaleDisDbls: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "data3": .silver, "blank": .white
    ]
    
}
