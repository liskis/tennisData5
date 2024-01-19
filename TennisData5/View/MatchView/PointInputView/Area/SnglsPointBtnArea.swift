//
//  SnglsPointBtnArea.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/01/19.
//

import SwiftUI

struct SnglsPointBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack(spacing:1){
            getPointBtn
            lostPointBtn
        }.padding(.horizontal,10)
        HStack(spacing:1){
            myWinnerBtn
            opponentWinerBtn
        }.padding(.horizontal,10)
        HStack(spacing:1){
            opponentMissBtn
            myMissBtn
        }.padding(.horizontal,10)
    }
    var getPointBtn: some View {
        Button(action: {
            if positionVM.position != .NoSelection {
                pointVM.myPoint += 1
                positionVM.position = .NoSelection
                pointVM.service = .first
                positionVM.gameSide = .noSelection
            }
        },label:{
            Text("ポイントをとった")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.red}
                .cornerRadius(4)
        })
    }
    var lostPointBtn: some View {
        Button(action: {
            if positionVM.position != .NoSelection {
                pointVM.opponentPoint += 1
                positionVM.position = .NoSelection
                pointVM.service = .first
                positionVM.gameSide = .noSelection
            }
        },label:{
            Text("ポイントをとられた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.blue}
                .cornerRadius(4)
        })
    }
    var myWinnerBtn: some View {
        Button(action: {
            
        },label:{
            Text("自分が決めた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.gray}
                .cornerRadius(4)
        })
        .disabled(true)
    }
    var opponentMissBtn: some View {
        Button(action: {
            
        },label:{
            Text("相手がミス")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.gray}
                .cornerRadius(4)
        })
        .disabled(true)
    }
    var opponentWinerBtn: some View {
        Button(action: {
            
        },label:{
            Text("相手が決めた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.gray}
                .cornerRadius(4)
        })
        .disabled(true)
    }
    var myMissBtn: some View {
        Button(action: {
            
        },label:{
            Text("自分がミス")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.gray}
                .cornerRadius(4)
        })
        .disabled(true)
    }
}

