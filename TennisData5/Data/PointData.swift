//
//  PointData.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/13.
//

import Foundation
struct PointData {
    
    
   
    
    func today(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.date(from: dateString)!
    }
    
}
