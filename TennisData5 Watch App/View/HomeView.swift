import SwiftUI
struct HomeView: View {
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var positionVM = PositionViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    var body: some View {
        VStack(spacing: 1){
            MyNameAndScoreArea(matchInfoVM: matchInfoVM, pointVM: pointVM)
            ScrollView {
                VStack(spacing:1){
                        HStack {
                            goBackBtn
                            Spacer()
                        }
                        if matchInfoVM.matchFormat == .singles {
                            ServOrRetArea(positionVM: positionVM, pointVM: pointVM)
                            SnglsPositionBtnArea(positionVM: positionVM)
                        } else if matchInfoVM.matchFormat == .doubles {
                            ServOrRetArea(positionVM: positionVM, pointVM: pointVM)
                            DblsPositionBtnArea(positionVM: positionVM)
                        }
                        if positionVM.position == .NoSelection {
                            faultBtnDis
                        } else if pointVM.service == .first {
                            faultBtn
                        } else if pointVM.service == .second {
                            doubleFaultBtn
                        }
                        if matchInfoVM.matchFormat == .singles {
                            SnglsPointBtnArea(positionVM: positionVM, pointVM: pointVM)
                        } else if matchInfoVM.matchFormat == .doubles {
                            DblsPointBtnArea(positionVM: positionVM, pointVM: pointVM)
                        }
                        nextGameBtn
                        gameEndBtn
                    }
                ChartsLayOutArea(matchInfoVM: matchInfoVM, chartDataVM: chartDataVM)
            }.frame(height: WKInterfaceDevice.current().screenBounds.size.height*0.75)
            Spacer()
        }
    }
    var goBackBtn: some View {
        Text("<< 一つ戻る")
            .frame(height: 30)
            .frame(width: 60)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.ocean)
            )
            .onTapGesture {
                if pointVM.service == .second {
                    pointVM.service = .first
                } else if positionVM.position != .NoSelection {
                    positionVM.position = .NoSelection
                } else if positionVM.servOrRet != .noSelection && pointVM.myPoint + pointVM.opponentPoint == 0 {
                    positionVM.servOrRet = .noSelection
                }
            }
    }
    var faultBtnDis: some View {
        Text("フォルト")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.gray)
            )
    }
    var faultBtn: some View {
        Text("フォルト")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.cyan)
            )
            .onTapGesture {
                if positionVM.position != .NoSelection {
                    pointVM.service = .second
                }
            }
    }
    var doubleFaultBtn: some View {
        Text("ダブルフォルト")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.grape)
            )
            .onTapGesture {
                if positionVM.servOrRet == .serviceGame {
                    pointVM.opponentPoint += 1
                } else if positionVM.servOrRet == .returnGame {
                    pointVM.myPoint += 1
                }
                positionVM.position = .NoSelection
                pointVM.service = .first
            }
    }
    var nextGameBtn: some View {
        Text("次のゲームへ")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.ocean)
            )
            .onTapGesture {
                if pointVM.myPoint > pointVM.opponentPoint {
                    pointVM.winCount += 1
                } else if pointVM.myPoint < pointVM.opponentPoint {
                    pointVM.loseCount += 1
                } else if pointVM.myPoint == pointVM.opponentPoint {
                    pointVM.drowCount += 1
                }
                pointVM.service = .first
                positionVM.position = .NoSelection
                positionVM.servOrRet = .noSelection
                pointVM.myPoint = 0
                pointVM.opponentPoint = 0
                matchInfoVM.gameId = UUID().uuidString
            }
    }
    var gameEndBtn: some View {
        Text("ゲームを終了する")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.ocean)
            )
            .onTapGesture {
                
            }
    }
}

