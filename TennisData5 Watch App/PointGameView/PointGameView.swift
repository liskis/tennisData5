import SwiftUI
struct PointGameView: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var homeVM: HomeViewModel
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing:1){
                Spacer().frame(height: 20)
                PointGameScoreArea(
                    dataManageVM: dataManageVM,
                    matchInfoVM: matchInfoVM,
                    positionVM: positionVM,
                    pointVM: pointVM,
                    chartDataVM: chartDataVM,
                    homeVM: homeVM
                )
                ScrollView {
                    VStack(spacing:1){
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
                        Spacer().frame(height: 20)
                        if pointVM.allPoint == 0 && pointVM.allCount != 0 {
                            gameEndBtn
                        } else {
                            gameEndBtnDis
                        }
                        Spacer().frame(height: 10)
                        ChartsLayOutArea(
                            matchInfoVM: matchInfoVM,
                            chartDataVM: chartDataVM
                        )
                        
                    }
                }
            }
            .frame(height: watchHeight)
            if homeVM.toOneMatchDataView {
                OneMatchDataView(
                    dataManageVM: dataManageVM,
                    pointVM: pointVM,
                    matchInfoVM: matchInfoVM,
                    chartDataVM: chartDataVM,
                    homeVM: homeVM
                )
                .transition(.move(edge: .bottom))
            }
        }
        .ignoresSafeArea()
        
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
                        dataManageVM.fault()
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
                        dataManageVM.doubleFault()
                    }
            }
    }
    var gameEndBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(height: 30)
            .overlay{
                Text("試合終了")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        dataManageVM.gameEnd()
                    }
            }
    }
    var gameEndBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("試合終了")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
}
