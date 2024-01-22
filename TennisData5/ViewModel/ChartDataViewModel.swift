import Foundation
import SwiftUI
class ChartDataViewModel: ObservableObject {
    @Published var firstSvIn: [BarChartDataModel] = [
        .init(value: 66.7, color: .ocean, category: "firstSvIn", index: 60.0),
        .init(value: 33.3, color: .mercury, category: "firstSvIn",index:60.0)
    ]
    @Published var secondSvIn: [BarChartDataModel] = [
        .init(value: 83.3, color: .ocean, category: "secondSvIn", index: 80.0),
        .init(value: 16.7, color: .mercury, category: "secondSvIn", index: 80.0)
    ]
    @Published var atFirstSv: [BarChartDataModel] = [
        .init(value: 83.3, color: .ocean, category: "atFirstSv", index: 80.0),
        .init(value: 16.7, color: .mercury, category: "atFirstSv",index:80.0)
    ]
    @Published var atSecondSv: [BarChartDataModel] = [
        .init(value: 60.0, color: .ocean, category: "atSecondSv", index: 60.0),
        .init(value: 40.0, color: .mercury, category: "atSecondSv", index: 60.0)
    ]
    @Published var serviceGameKeep: [BarChartDataModel] = [
        .init(value: 50.0, color: .maraschino, category: "serviceGameKeep", index: 70.0),
        .init(value: 50.0, color: .mercury, category: "serviceGameKeep", index: 70.0)
    ]
    @Published var returnGameBreak: [BarChartDataModel] = [
        .init(value: 16.7, color: .maraschino, category: "returnGameBreak", index: 30.0),
        .init(value: 83.3, color: .mercury, category: "returnGameBreak", index: 30.0)
    ]
    @Published var getAndLostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "とった\nポイント", value: 70, textPsition: .low),
        .init(name: "data2", nameString: "とられた\nポイント", value: 50, textPsition: .low),
        .init(name: "blank", nameString: "", value: 120, textPsition: .low)
    ]
    @Published var getAndLostPointStyleScale: KeyValuePairs<String, Color> = [
        "data1": .red, "data2": .blue, "blank": .white
    ]
    @Published var missCount: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 30, textPsition: .low),
        .init(name: "data2", nameString: "自分の\nミス", value: 20, textPsition: .low),
        .init(name: "blank", nameString: "", value: 50, textPsition: .low)
    ]
    @Published var winnerCount: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 30, textPsition: .low),
        .init(name: "data2", nameString: "相手が\n決めた", value: 20, textPsition: .low),
        .init(name: "blank", nameString: "", value: 50, textPsition: .low)
    ]
    @Published var getPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 30, textPsition: .low),
        .init(name: "data2", nameString: "相手の\nミス", value: 20, textPsition: .low),
        .init(name: "blank", nameString: "", value: 50, textPsition: .low)
    ]
    @Published var lostPoint: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手が\n決めた", value: 30, textPsition: .low),
        .init(name: "data2", nameString: "自分の\nミス", value: 20, textPsition: .low),
        .init(name: "blank", nameString: "", value: 50, textPsition: .low)
    ]
    
    @Published var styleScaleDis: KeyValuePairs<String, Color> = [
        "data1": .silver, "data2": .mercury, "blank": .white
    ]
    @Published var missCountDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "相手の\nミス", value: 30, textPsition: .low),
        .init(name: "data2", nameString: "自分の\nミス", value: 20, textPsition: .highRight),
        .init(name: "data2", nameString: "味方の\nミス", value: 10, textPsition: .low),
        .init(name: "blank", nameString: "", value: 60, textPsition: .low)
    ]
    @Published var winnerCountDbls: [PieChartDataModel] = [
        .init(name: "data1", nameString: "自分が\n決めた", value: 30, textPsition: .low),
        .init(name: "data1", nameString: "味方が\n決めた", value: 30, textPsition: .highLeft),
        .init(name: "data2", nameString: "相手が\n決めた", value: 60, textPsition: .low),
        .init(name: "blank", nameString: "", value: 120, textPsition: .low)
    ]
    @Published var styleScaleDisDbls: KeyValuePairs<String, Color> = [
        "data1": .magnesium, "data2": .silver, "data3": .mercury, "blank": .white
    ]
}
