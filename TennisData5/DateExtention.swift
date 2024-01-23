//
//  DateExtention.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/23.
//

import Foundation
extension Date {
    var calendar: Calendar {
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .current
        calendar.locale = Locale(identifier: "ja-JP")
        return calendar
    }
    
}
