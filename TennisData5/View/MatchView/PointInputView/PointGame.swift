import Foundation
import SwiftUI
struct PointGame: View {
    @ObservedObject var matchInfoVM:MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                Spacer().frame(height: 20)
                MyNameAndScoreArea(matchInfoVM: matchInfoVM, pointVM: pointVM)
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
                    if matchInfoVM.matchFormat == .singles {
                        SnglsPositionBtnArea(positionVM: positionVM)
                    } else if matchInfoVM.matchFormat == .doubles {
                        DblsGameSideArea(positionVM: positionVM)
                        DblsPositionBtnArea(positionVM: positionVM)
                    }
                    Spacer().frame(height: 10)
                    if positionVM.position != .NoSelection {
                        if pointVM.service == .first {
                            faultBtn
                        } else {
                            doubleFaultBtn
                        }
                    }
                    Spacer().frame(height: 10)
                    
                    if matchInfoVM.matchFormat == .singles {
                        SnglsPointBtnArea(positionVM: positionVM, pointVM: pointVM)
                    } else if matchInfoVM.matchFormat == .doubles {
                        DblsPointBtnArea(positionVM: positionVM, pointVM: pointVM)
                    }
                    Spacer().frame(height: 10)
                    nextGameBtn
                    gameEndBtn
                }
                .background{ Color.white}
                Spacer()
            }
            .background{ Color.mercury }
            .navigationBarTitle("シングルスポイントゲーム")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    var goBackBtn: some View {
        Button(action: {
            if pointVM.service == .second {
                pointVM.service = .first
            } else if positionVM.position != .NoSelection {
                positionVM.position = .NoSelection
            } else if positionVM.gameSide != .noSelection {
                positionVM.gameSide = .noSelection
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
    var faultBtn: some View {
        Button(action: {
            if positionVM.position != .NoSelection {
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
        }).padding(.horizontal,10)
    }
    var doubleFaultBtn: some View {
        Button(action: {
            if positionVM.gameSide == .serviceGame {
                pointVM.opponentPoint += 1
            } else if positionVM.gameSide == .returnGame {
                pointVM.myPoint += 1
            }
            positionVM.position = .NoSelection
            pointVM.service = .first
            positionVM.gameSide = .noSelection
        },label:{
            Text("ダブルフォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.grape}
                .cornerRadius(4)
        })
    }
    var nextGameBtn: some View {
        Button(action: {
            if pointVM.myPoint > pointVM.opponentPoint {
                pointVM.winCount += 1
            } else if pointVM.myPoint < pointVM.opponentPoint {
                pointVM.loseCount += 1
            } else if pointVM.myPoint == pointVM.opponentPoint {
                pointVM.drowCount += 1
            }
            pointVM.service = .first
            positionVM.position = .NoSelection
            positionVM.gameSide = .noSelection
            pointVM.myPoint = 0
            pointVM.opponentPoint = 0
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
        })
    }
    var gameEndBtn: some View {
        Button(action: {
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
        })
    }
}




