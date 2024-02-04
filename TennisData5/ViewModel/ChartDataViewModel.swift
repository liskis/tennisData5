import Foundation
import SwiftUI
import RealmSwift
class ChartDataViewModel: ObservableObject {
    @Published var firstSvInCount: String = "No Data"
    @Published var firstSvIn: [BarChartDataModel] = []
    @Published var secondSvInCount: String = "No Data"
    @Published var secondSvIn: [BarChartDataModel] = []
    @Published var noDoubleFaultCount: String = "No Data"
    @Published var noDoubleFault: [BarChartDataModel] = []
    @Published var atFirstSvCount: String = "No Data"
    @Published var atFirstSv: [BarChartDataModel] = []
    @Published var atSecondSvCount: String = "No Data"
    @Published var atSecondSv: [BarChartDataModel] = []
    
    @Published var getAndLostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "とった\nポイント", value: 70, labelType: .twoLabels),
        .init(name: "data2", nameString: "とられた\nポイント", value: 50, labelType: .twoLabels),
        .init(name: "blank", nameString: "", value: 120 , labelType: .twoLabels)
    ]
    @Published var getAndLostPointStyleScale: KeyValuePairs<String, Color> = [
        "data1": .ocean, "data2": .cantaloupe, "blank": .white
    ]
    @Published var keepAndBreak: [PieChartDataModel] = [
        .init(name: "data1", nameString: "キープ率", value: 66.67, labelType: .keepAndBreak),
        .init(name: "data2", nameString: "ブレーク率", value: 20.0, labelType: .keepAndBreak),
        .init(name: "data3", nameString: "サービス\nロスト率", value: 33.33, labelType: .keepAndBreak),
        .init(name: "data4", nameString: "リターン\nロスト率", value: 80.0, labelType: .keepAndBreak),
        .init(name: "blank", nameString: "", value: 200, labelType: .keepAndBreak)
    ]
    @Published var keepAndBreakStyleScale: KeyValuePairs<String, Color> = [
        "data1": .ocean, "data2": .aqua, "data3": .tangerine, "data4": .cantaloupe ,"blank": .white
    ]
    
    @Published var winnerPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "", value: 2, labelType: .twoLabels)
    ]
    @Published var missPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "", value: 2, labelType: .twoLabels)
    ]
    @Published var getPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "相手の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "", value: 2, labelType: .twoLabels)
    ]
    @Published var lostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 1, labelType: .twoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .twoLabels),
        .init(name: "blank", nameString: "", value: 2, labelType: .twoLabels)
    ]
    
    @Published var styleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "blank": .white
    ]
    
    @Published var winnerPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手が\n決めた", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var missPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "味方の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var getPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data2", nameString: "味方が\n決めた", value: 1, labelType: .twoAndOneLabels),
        .init(name: "data3", nameString: "相手の\nミス", value: 2, labelType: .twoAndOneLabels),
        .init(name: "blank", nameString: "", value: 4, labelType: .twoAndOneLabels)
    ]
    @Published var lostPointDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 2, labelType: .oneAndTwoLabels),
        .init(name: "data2", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "data3", nameString: "自分の\nミス", value: 1, labelType: .oneAndTwoLabels),
        .init(name: "blank", nameString: "", value: 4, labelType: .oneAndTwoLabels)
    ]
    @Published var styleScaleDisDbls: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .silver, "data3": .silver, "blank": .white
    ]
    
}
