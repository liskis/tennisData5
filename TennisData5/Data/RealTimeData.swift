//
//  RealTimeDammyData.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/15.
//

import Foundation
import SwiftUI
struct RealTimeData {
    static let firstSvIn: [BarChartDataModel] = [
        .init(value: 66.7, color: .ocean, category: "firstSvIn", index: 60.0),
        .init(value: 33.3, color: .mercury, category: "firstSvIn",index:60.0)
    ]
    static let secondSvIn: [BarChartDataModel] = [
        .init(value: 83.3, color: .ocean, category: "secondSvIn", index: 80.0),
        .init(value: 16.7, color: .mercury, category: "secondSvIn", index: 80.0)
    ]
    static let atFirstSv: [BarChartDataModel] = [
        .init(value: 83.3, color: .ocean, category: "atFirstSv", index: 80.0),
        .init(value: 16.7, color: .mercury, category: "atFirstSv",index:80.0)
    ]
    static let atSecondSv: [BarChartDataModel] = [
        .init(value: 60.0, color: .ocean, category: "atSecondSv", index: 60.0),
        .init(value: 40.0, color: .mercury, category: "atSecondSv", index: 60.0)
    ]
    static let serviceGameKeep: [BarChartDataModel] = [
        .init(value: 50.0, color: .maraschino, category: "serviceGameKeep", index: 70.0),
        .init(value: 50.0, color: .mercury, category: "serviceGameKeep", index: 70.0)
    ]
    static let returnGameBreak: [BarChartDataModel] = [
        .init(value: 16.7, color: .maraschino, category: "returnGameBreak", index: 30.0),
        .init(value: 83.3, color: .mercury, category: "returnGameBreak", index: 30.0)
    ]
    static let getAndLostPoint: [PieChartDataModel] = [
        .init(name: "getPoint", nameString: "とったポイント", value: 70,  color: .red),
        .init(name: "lostPoint", nameString: "とられたポイント", value: 50, color: .blue),
        .init(name: "blank", nameString: "", value: 120, color: .white)
    ]
    static let missCount: [PieChartDataModel] = [
        .init(name: "myMiss", nameString: "自分のミス", value: 20,  color: .gray),
        .init(name: "opponentMiss", nameString: "味方のミス", value: 20, color: .magnesium),
        .init(name: "blank", nameString: "", value: 120, color: .white)
    ]
}
