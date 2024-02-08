import Foundation
import SwiftUI
struct PointGame: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var homeDataVM: HomeDataViewModel
    @ObservedObject var userVM: UserViewModel
//    @Environment(\.dismiss) var dismiss
    @State var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                Spacer(minLength: 20)
                MyNameAndScoreArea(
                    matchInfoVM: matchInfoVM,
                    pointVM: pointVM,
                    userVM: userVM
                )
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
                            HStack {
                                goBackBtn
                                Spacer()
                            }
                            Spacer().frame(height: 10)
                            ServOrRetArea(
                                positionVM: positionVM,
                                pointVM: pointVM
                            )
                            if matchInfoVM.matchFormat == .doubles {
                                DblsPositionBtnArea(
                                    positionVM: positionVM
                                )
                            } else if matchInfoVM.matchFormat == .singles {
                                SnglsPositionBtnArea(
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
                            Spacer().frame(height: 10)
                            nextGameBtn
                            if pointVM.allPoint + pointVM.allgameCount == 0 {
                                quitAfterAllBtn
                            } else {
                                gameEndBtn
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
    }
    var goBackBtn: some View {
        if pointVM.allPoint + pointVM.allgameCount == 0
            && positionVM.servOrRet == .noSelection {
            Button(action: {
                
            },label: {
                Text("<< 一つ戻る")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .frame(width: 120,height: 40)
                    .background{ Color.silver }
            })
            .padding(.leading,10)
            .cornerRadius(4)
        } else {
            Button(action: {
                if pointVM.service == .second {
                    pointVM.service = .first
                } else if positionVM.myPosition != .noSelection {
                    positionVM.myPosition = .noSelection
                } else if positionVM.servOrRet != .noSelection && pointVM.getPoint + pointVM.lostPoint == 0 {
                    positionVM.servOrRet = .noSelection
                } else {
                    dataManageVM.goBack()
                }
            },label: {
                Text("<< 一つ戻る")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .frame(width: 120,height: 40)
                    .background{ Color.ocean }
            })
            .padding(.leading,10)
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
            if positionVM.myPosition != .noSelection {
                pointVM.service = .second
            }
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
            if positionVM.servOrRet == .serviceGame {
                pointVM.whichPoint = .opponent
                pointVM.lostPoint += 1
            } else if positionVM.servOrRet == .returnGame {
                pointVM.whichPoint = .myTeam
                pointVM.getPoint += 1
            }
            pointVM.shot = .serve
            dataManageVM.pointRecoad()
            
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            
            if matchInfoVM.matchFormat == .doubles && positionVM.servOrRet == .returnGame {
                if positionVM.myPosition == .volleyer {
                    positionVM.myPosition = .returner
                } else {
                    positionVM.myPosition = .volleyer
                }
            }
            pointVM.service = .first
            pointVM.whichPoint = .noSelection
            pointVM.shot = .noSelection
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
    var nextGameBtn: some View {
        Button(action: {
            if pointVM.getPoint > pointVM.lostPoint {
                pointVM.getGameCount += 1
            } else if pointVM.getPoint < pointVM.lostPoint {
                pointVM.lostGameCount += 1
            } else if pointVM.getPoint == pointVM.lostPoint {
                pointVM.drowGameCount += 1
            }
            dataManageVM.gameRecoad()
            dataManageVM.setGameChart()
            pointVM.service = .first
            positionVM.myPosition = .noSelection
            positionVM.servOrRet = .noSelection
            pointVM.getPoint = 0
            pointVM.lostPoint = 0
            matchInfoVM.gameId = UUID().uuidString
        },label:{
            Text("次のゲームへ")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
    var gameEndBtn: some View {
        Button(action: {
            if pointVM.getPoint > pointVM.lostPoint {
                pointVM.getGameCount += 1
            } else if pointVM.getPoint < pointVM.lostPoint {
                pointVM.lostGameCount += 1
            } else if pointVM.getPoint == pointVM.lostPoint && pointVM.allPoint != 0{
                pointVM.drowGameCount += 1
            }
            if pointVM.allPoint != 0 {
                dataManageVM.gameRecoad()
            }
            dataManageVM.setRecoad()
            dataManageVM.matchRecoad()
            pointVM.service = .first
            positionVM.myPosition = .noSelection
            positionVM.servOrRet = .noSelection
            homeDataVM.setHomeData()
            isPresented = true
        },label:{
            Text("試合を保存して終了する")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
                .padding(.horizontal,10)
            
        })
        .fullScreenCover(isPresented: $isPresented) {
            OneMatchDataView(
                pointVM: pointVM,
                matchInfoVM: matchInfoVM,
                chartDataVM: chartDataVM
            )
        }
    }
    var quitAfterAllBtn: some View {
        Button(action: {
//            dismiss()
//            dataManageVM.showRealm()
//            dataManageVM.deleteRealm()
        },label:{
            Text("やっぱりやめる")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
}




