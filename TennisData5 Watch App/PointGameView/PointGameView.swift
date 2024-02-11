import SwiftUI
struct PointGameView: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var userVM: UserViewModel
    @Environment(\.dismiss) var dismiss
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    var body: some View {
        VStack(spacing:1){
            MyNameAndScoreArea(
                matchInfoVM: matchInfoVM,
                pointVM: pointVM,
                userVM: userVM
            )
            HStack {
                goBackBtn
                Spacer()
                Text("ビギナーモード")
                    .foregroundColor(.red)
                    .bold()
                    .padding(4)
                    .font(.custom("Verdana",size:6))
            }
            Spacer().frame(height: 10)
            ScrollView {
                VStack(spacing:1){
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
                    if positionVM.myPosition == .noSelection {
                        faultBtnDis
                    } else if pointVM.service == .first {
                        faultBtn
                    } else if pointVM.service == .second {
                        doubleFaultBtn
                    }
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
                    if pointVM.allPoint + pointVM.allgameCount == 0 {
                        nextGameBtnDis
                        gameEndBtnDis
                    } else {
                        nextGameBtn
                        gameEndBtn
                    }
                }
                ChartsLayOutArea(
                    matchInfoVM: matchInfoVM,
                    chartDataVM: chartDataVM
                )
                Spacer().frame(height: 30)
            }
            .frame(height: watchHeight * 0.6)
            
        
            
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
                if pointVM.allPoint + pointVM.allgameCount == 0
                    && positionVM.servOrRet == .noSelection {
                    dismiss()
                } else {
                    if pointVM.service == .second {
                        pointVM.service = .first
                    } else if positionVM.myPosition != .noSelection {
                        positionVM.myPosition = .noSelection
                    } else if positionVM.servOrRet != .noSelection && pointVM.allPoint == 0 {
                        positionVM.servOrRet = .noSelection
                    } else {
                        dataManageVM.goBack()
                    }
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
                if positionVM.myPosition != .noSelection {
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
            }
    }
    var nextGameBtnDis: some View {
        Text("次のゲームへ")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.silver)
            )
    }
    var gameEndBtn: some View {
        Text("試合を保存して終了する")
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
                dismiss()
            }
    }
    var gameEndBtnDis: some View {
        Text("試合を保存して終了する")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.silver)
            )
    }
}
