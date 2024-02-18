//
//  OneMatchDataView.swift
//  TennisData5 Watch App
//
//  Created by 渡辺健輔 on 2024/02/15.
//

import SwiftUI

struct OneMatchDataView: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var homeVM: HomeViewModel
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:1){
                Spacer().frame(height: 20)
                OneMatchDataScoaArea(
                    matchInfoVM: matchInfoVM,
                    pointVM: pointVM
                )
                Spacer().frame(height: 5)
                HStack {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(.ocean)
                        .frame(width: 60,height: 20)
                        .overlay{
                            Text("閉じる")
                                .foregroundColor(Color.white)
                                .bold()
                                .font(.custom("Verdana", size: 8))
                                .onTapGesture {
                                    Task{
                                        await dataManageVM.WCCloseOneMatchData()
                                    }
                                    dataManageVM.resetAllVM()
                                    homeVM.toOneMatchDataView = false
                                    homeVM.toPointGameView = false
                                }
                        }
                    
                    Spacer()
                    Text("ビギナーモード")
                        .foregroundColor(.red)
                        .bold()
                        .padding(4)
                        .font(.custom("Verdana",size:6))
                }
                Spacer().frame(height: 5)
                ScrollView {
                    
                    ChartsLayOutArea(
                        matchInfoVM: matchInfoVM,
                        chartDataVM: chartDataVM
                    )
                    Spacer()
                }
            }
            .frame(height: watchHeight)
        }
        .ignoresSafeArea()
    }
}
