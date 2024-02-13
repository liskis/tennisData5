import SwiftUI
struct HomeView: View {
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    @ObservedObject var dataManageVM = DataManageViewModel()
    @ObservedObject var userVM = UserViewModel()
    @ObservedObject var homeVM: HomeViewModel
    @State var naviTitle: String = ""
    @State var toPointGameView: Bool = false
    var body: some View {
        VStack(spacing: 0){
            headerLogo
            headerBar
            Spacer()
            if homeVM.latestMatch.matchId != "" {
                latestMatch
                Spacer()
            }
            gameStartBtns
            Spacer()
        }
        .frame(height: watchHeight * 0.9)
        .overlay {
            if toPointGameView {
                PointGameView(
                    dataManageVM: dataManageVM,
                    pointVM: dataManageVM.pointVM,
                    matchInfoVM: dataManageVM.matchInfoVM,
                    positionVM: dataManageVM.positionVM,
                    chartDataVM: dataManageVM.chartDataVM,
                    userVM: userVM,
                    homeVM: homeVM
                )
            }
        }
//        .sheet(isPresented: $toPointGameView, onDismiss: {
//            dataManageVM.resetAllVM()
//        }) {
//            PointGameView(
//                dataManageVM: dataManageVM,
//                pointVM: dataManageVM.pointVM,
//                matchInfoVM: dataManageVM.matchInfoVM,
//                positionVM: dataManageVM.positionVM,
//                chartDataVM: dataManageVM.chartDataVM,
//                userVM: userVM,
//                homeVM: homeVM
//            )
//        }
        .onAppear{
            dataManageVM.showSetRealm()
            dataManageVM.showMatchRealm()
//            dataManageVM.deleteRealm()
        }
    }
    var headerLogo: some View{
        HStack{
            Spacer().frame(width: 10)
            Image(.logo)
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .frame(height: 20)
    }
    var headerBar: some View {
        HStack(spacing:0) {
            Spacer()
            Image(.angleG)
                .resizable()
                .scaledToFit()
            Text(userVM.myName + " さん")
                .font(.custom("Verdana",size:8))
                .bold()
                .foregroundColor(.white)
                .frame(height:20)
                .background(.nameBtn)
                .clipped()
            Image(.angleGW)
                .resizable()
                .scaledToFit()
            VStack {
                Text("初心者")
                    .font(.custom("Verdana", size: 8))
                    .foregroundColor(Color.tungsten)
                Text("ビギナーモード")
                    .font(.custom("Verdana", size: 8))
                    .foregroundColor(Color.red)
                    .bold()
            }
            .frame(height:20)
            .background(.white)
            .clipped()
        }
        .frame(height: 20)
    }
    var latestMatch: some View {
        HStack{
            Spacer()
            if homeVM.latestMatch.matchFormat == .singles {
                Image(.singles)
                    .resizable()
                    .scaledToFit()
            } else if homeVM.latestMatch.matchFormat == .doubles {
                Image(.doubles)
                    .resizable()
                    .scaledToFit()
            }
            Spacer()
            Text(homeVM.latestMatch.gameType.forString)
                .font(.custom("Verdana", size: 10))
                .foregroundColor(Color.white)
            Spacer()
            Text(Date.dateToString(date: homeVM.latestMatch.matchStartDate, format: "YY/MM/dd"))
                .font(.custom("Verdana", size: 10))
                .foregroundColor(Color.white)
            Spacer()
            if homeVM.latestMatch.WinScore > homeVM.latestMatch.LoseScore {
                Text("Win")
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(Color.red)
                    .bold()
            } else if homeVM.latestMatch.WinScore < homeVM.latestMatch.LoseScore {
                Text("Lose")
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(Color.blue)
                    .bold()
            } else {
                Text("Drow")
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(Color.silver)
                    .bold()
            }
            Spacer()
        }
        .frame(height: 12)
    }
    var gameStartBtns: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                Text("シングルス\nポイントゲーム")
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
                        dataManageVM.matchInfoVM.matchFormat = .singles
                        dataManageVM.matchInfoVM.gameType = .pointGame
                        naviTitle = "シングルスポイントゲーム"
                        toPointGameView = true
                    }
                Text("ダブルス\nポイントゲーム")
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
                        dataManageVM.matchInfoVM.matchFormat = .doubles
                        dataManageVM.matchInfoVM.gameType = .pointGame
                        naviTitle = "ダブルスポイントゲーム"
                        toPointGameView = true
                    }
            }
        }
    }
}
