//
//  AdMobPopUp.swift
//  TennisData5
//
//  Created by 渡辺健輔 on 2024/02/26.
//

import SwiftUI

struct AdMobPopUp: View {
    
    @ObservedObject var homeVM: HomeViewModel
    let adMobWidth = UIScreen.main.bounds.width*0.9
    let adMobHeight = UIScreen.main.bounds.height*0.6
    
    var body: some View {
        ZStack {
            AdMobInterStitialView()
            VStack {
                HStack {
                    Spacer()
                    Button(action: ({
                        homeVM.adMobPopUp = false
                    }), label: ({
                        Circle()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Text("✖️")
                                    .font(.custom("Verdana", size: 30))
                                    .foregroundColor(.tungsten)
                            )
                    }))
                }
                Spacer()
            }
        }
        .frame(width: adMobWidth, height: adMobHeight, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}

