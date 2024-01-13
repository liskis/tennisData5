//
//  HomeGraphData.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/12.
//

import Foundation
struct HomeGraphData {
    static let data1: [LineGraphData] = [
        .init(dateString: "23/12/1", stats: 60, category: "data1", issue: .Win),
        .init(dateString: "23/12/8", stats: 63, category: "data1", issue: .Win),
        .init(dateString: "23/12/15", stats: 70, category: "data1", issue: .Lose),
        .init(dateString: "23/12/16", stats: 70, category: "data1", issue: .Lose),
        .init(dateString: "23/12/22", stats: 70, category: "data1", issue: .Win)
    ]
    static let data2: [LineGraphData] = [
        .init(dateString: "23/12/1", stats: 90, category: "data2", issue: .Win),
        .init(dateString: "23/12/8", stats: 96, category: "data2", issue: .Win),
        .init(dateString: "23/12/15", stats: 89, category: "data2", issue: .Lose),
        .init(dateString: "23/12/16", stats: 96, category: "data2", issue: .Lose),
        .init(dateString: "23/12/22", stats: 96, category: "data2", issue: .Win)
    ]
   
    static func minAxis() -> Int{
        var minData: Int = 100
        for data in self.data1 {
            minData = data.stats < minData ? data.stats : minData
        }
        for data in self.data2 {
            minData = data.stats < minData ? data.stats : minData
        }
        return minData - 20
    }
}
