//
//  Buttons.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/14.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        Button(action: {
            if pointInputModel.service == .second {
                pointInputModel.service = .first
            } else if pointInputModel.position != .NoSelection {
                pointInputModel.position = .NoSelection
            }
        },label: {
            Text("<< 一つ戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
        })
        .frame(width: 120,height: 40)
        .background{ Color.brown }
        .cornerRadius(4)
    }
    var goBackBtn: some View {
        
    }
}

//#Preview {
//    Buttons()
//}
