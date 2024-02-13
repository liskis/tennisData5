import SwiftUI
struct PointGameView: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var homeVM: HomeViewModel
    @Environment(\.dismiss) var dismiss
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:1){
                Spacer().frame(height: 30)
                PointGameScoreArea(
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
                    Spacer()
                }
            }
            .frame(height: watchHeight)
        }
        .ignoresSafeArea()
    }
    var goBackBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(width: 60,height: 30)
            .overlay{
                Text("<< 戻る")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        goBack()
                    }
            }
    }
    var faultBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("フォルト")
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var faultBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.cyan)
            .frame(height: 30)
            .overlay{
                Text("フォルト")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        fault()
                    }
            }
    }
    var doubleFaultBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.grape)
            .frame(height: 30)
            .overlay{
                Text("ダブルフォルト")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        doubleFault()
                    }
            }
    }
    var nextGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(height: 30)
            .overlay{
                Text("次のゲームへ")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        nextGame()
                    }
            }
    }
    var nextGameBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("次のゲームへ")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var gameEndBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(height: 30)
            .overlay{
                Text("試合を保存して終了する")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        gameEnd()
                    }
            }
    }
    var gameEndBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("試合を保存して終了する")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
}
extension PointGameView {
    func goBack(){
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
    func fault(){
        if positionVM.myPosition != .noSelection {
            pointVM.service = .second
        }
    }
    func doubleFault(){
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
    func nextGame(){
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
    func gameEnd(){
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
        homeVM.setLatestMatch()
        dismiss()
    }
}
