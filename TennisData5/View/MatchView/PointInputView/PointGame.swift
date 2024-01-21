import Foundation
import SwiftUI
struct PointGame: View {
    @ObservedObject var matchVM: MatchViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Text(matchVM.matchInfoVM.naviTitle)
                    .font(.custom("Verdana",size:15))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                VStack(spacing:0){
                    Spacer(minLength: 20)
                    MyNameAndScoreArea(matchInfoVM: matchVM.matchInfoVM, pointVM: matchVM.pointVM)
                    HStack{
                        Spacer()
                        Text("ビギナーモード")
                            .padding(10)
                            .background(.white)
                            .font(.custom("Verdana",size:10))
                    }
                    VStack(spacing:1){
                        Spacer().frame(height:10)
                        HStack {
                            goBackBtn
                            Spacer()
                        }
                        Spacer().frame(height: 10)
                        if matchVM.matchInfoVM.matchFormat == .singles {
                            GameSideArea(positionVM: matchVM.positionVM, pointVM: matchVM.pointVM)
                            SnglsPositionBtnArea(positionVM: matchVM.positionVM)
                        } else if matchVM.matchInfoVM.matchFormat == .doubles {
                            GameSideArea(positionVM: matchVM.positionVM, pointVM: matchVM.pointVM)
                            DblsPositionBtnArea(positionVM: matchVM.positionVM)
                        }
                        Spacer().frame(height: 10)
                        if matchVM.positionVM.position == .NoSelection {
                            faultBtnDis
                        } else if matchVM.pointVM.service == .first {
                            faultBtn
                        } else if matchVM.pointVM.service == .second {
                            doubleFaultBtn
                        }
                        Spacer().frame(height: 10)
                        
                        if matchVM.matchInfoVM.matchFormat == .singles {
                            SnglsPointBtnArea(positionVM: matchVM.positionVM, pointVM: matchVM.pointVM)
                        } else if matchVM.matchInfoVM.matchFormat == .doubles {
                            DblsPointBtnArea(positionVM: matchVM.positionVM, pointVM: matchVM.pointVM)
                        }
                        Spacer().frame(height: 10)
                        nextGameBtn
                        gameEndBtn
                    }
                    .background{ Color.white}
                    Spacer()
                }
                .background{ Color.mercury }
            }
        }
    }
    var goBackBtn: some View {
        Button(action: {
            if matchVM.pointVM.service == .second {
                matchVM.pointVM.service = .first
            } else if matchVM.positionVM.position != .NoSelection {
                matchVM.positionVM.position = .NoSelection
            } else if matchVM.positionVM.gameSide != .noSelection && matchVM.pointVM.myPoint + matchVM.pointVM.opponentPoint == 0 {
                matchVM.positionVM.gameSide = .noSelection
            }
        },label: {
            Text("<< 一つ戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(width: 120,height: 40)
                .background{ Color.ocean }
                .padding(.leading,10)
                .cornerRadius(4)
        })
        
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
            if matchVM.positionVM.position != .NoSelection {
                matchVM.pointVM.service = .second
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
            if matchVM.positionVM.gameSide == .serviceGame {
                matchVM.pointVM.opponentPoint += 1
            } else if matchVM.positionVM.gameSide == .returnGame {
                matchVM.pointVM.myPoint += 1
            }
            matchVM.positionVM.position = .NoSelection
            matchVM.pointVM.service = .first
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
            if matchVM.pointVM.myPoint > matchVM.pointVM.opponentPoint {
                matchVM.pointVM.winCount += 1
            } else if matchVM.pointVM.myPoint < matchVM.pointVM.opponentPoint {
                matchVM.pointVM.loseCount += 1
            } else if matchVM.pointVM.myPoint == matchVM.pointVM.opponentPoint {
                matchVM.pointVM.drowCount += 1
            }
            matchVM.pointVM.service = .first
            matchVM.positionVM.position = .NoSelection
            matchVM.positionVM.gameSide = .noSelection
            matchVM.pointVM.myPoint = 0
            matchVM.pointVM.opponentPoint = 0
            matchVM.matchInfoVM.gameId = UUID().uuidString
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
            matchVM.matchInfoVM.resetModel()
            matchVM.pointVM.resetModel()
            matchVM.positionVM.resetModel()
            dismiss()
        },label:{
            Text("ゲームを終了する")
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




