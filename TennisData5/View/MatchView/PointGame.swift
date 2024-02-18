import Foundation
import SwiftUI
struct PointGame: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var pointVM: PointViewModel
    @State var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                Spacer(minLength: 20)
                PointGameScoreArea(
                    matchInfoVM: matchInfoVM,
                    pointVM: pointVM,
                    userVM: userVM
                )
                HStack(spacing:1) {
                    goBackBtn
                    if pointVM.allPoint == 0 {
                        nextGameBtnDis
                    } else {
                        nextGameBtn
                    }
                    if pointVM.allgameCount != 0 && pointVM.allPoint == 0 {
                        gameEndBtn
                    } else {
                        gameEndBtnDis
                    }
                }
                .padding(.horizontal,10)
                
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Text("ビギナーモード")
                        .padding(10)
                        .background(.white)
                        .font(.custom("Verdana",size:10))
                }
                VStack(spacing:1){
                    ScrollView {
                        VStack(spacing:1){
                            Spacer().frame(height:10)
                            
                            Spacer().frame(height: 10)
                            ServOrRetArea(
                                dataManageVM: dataManageVM,
                                positionVM: positionVM,
                                pointVM: pointVM
                            )
                            if matchInfoVM.matchFormat == .doubles {
                                DblsPositionBtnArea(
                                    dataManageVM: dataManageVM,
                                    positionVM: positionVM
                                )
                            } else if matchInfoVM.matchFormat == .singles {
                                SnglsPositionBtnArea(
                                    dataManageVM: dataManageVM,
                                    positionVM: positionVM
                                )
                            }
                            Spacer().frame(height: 10)
                            if positionVM.myPosition == .noSelection {
                                faultBtnDis
                            } else if pointVM.service == .first {
                                faultBtn
                            } else if pointVM.service == .second {
                                doubleFaultBtn
                            }
                            Spacer().frame(height: 10)
                            if matchInfoVM.matchFormat == .singles {
                                SnglsPointBtnArea(
                                    dataManageVM: dataManageVM,
                                    positionVM: positionVM,
                                    pointVM: pointVM
                                )
                            } else if matchInfoVM.matchFormat == .doubles {
                                DblsPointBtnArea(
                                    dataManageVM: dataManageVM,
                                    positionVM: positionVM,
                                    pointVM: pointVM
                                )
                            }
                        }
                    }
                }
                .background{ Color.white}
                Spacer()
            }
            .background{ Color.mercury }
        .navigationBarTitle(matchInfoVM.naviTitle, displayMode: .inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark)
        }
        .fullScreenCover(isPresented: $homeVM.toOneMatchDataView) {
            OneMatchDataView(
                dataManageVM: dataManageVM,
                homeVM: homeVM,
                pointVM: pointVM,
                matchInfoVM: matchInfoVM,
                chartDataVM: chartDataVM
            )
        }
    }
    var goBackBtn: some View {
        Button(action: {
            dataManageVM.goBack()
            Task{
                await dataManageVM.WCGoBack()
            }
        },label: {
            Text("<< 戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background{ Color.ocean }
        })
        .cornerRadius(4)
    }
    var nextGameBtn: some View {
        Button(action: {
            dataManageVM.nextGame()
        },label:{
            Text("次のゲームへ >>")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        })
    }
    var nextGameBtnDis: some View {
        Button(action: {
            
        },label:{
            Text("次のゲームへ >>")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        })
    }
    var gameEndBtn: some View {
        Button(action: {
            dataManageVM.gameEnd()
        }){
            Text("試合を終了する")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        }
    }
    var gameEndBtnDis: some View {
        Button(action: {
            
        }){
            Text("試合を終了する")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        }
    }
    var faultBtnDis: some View {
        Button(action: {
            
        },label:{
            Text("フォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        })
        .padding(.horizontal,10)
        .disabled(true)
    }
    var faultBtn: some View {
        Button(action: {
            dataManageVM.fault()
        },label:{
            Text("フォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.cyan}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
    var doubleFaultBtn: some View {
        Button(action: {
            dataManageVM.doubleFault()
        },label:{
            Text("ダブルフォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.grape}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
}



