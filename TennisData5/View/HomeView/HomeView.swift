import SwiftUI
struct HomeView: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                VStack(spacing:0){
                    Spacer().frame(height: 40)
                    StatsDataArea(
                        homeVM: homeVM
                    )
                    Spacer().frame(height: 10)
                    LineChartView(
                        valueData: $homeVM.firstSvInChartData,
                        signPost: $homeVM.signPost
                    )
                    LineChartView(
                        valueData: $homeVM.doubleFaultRateChartData,
                        signPost: $homeVM.signPost
                    )
                    winLoseArrayArea
                    dateArrayArea
                    Spacer().frame(height: 10)
                }
                .background{
                    Image(.tennisCourt)
                        .resizable()
                        .scaledToFill()
                }
                .clipped()
                VStack{
                    Spacer().frame(height: 10)
                    GameStartBtnsArea(
                        dataManageVM: dataManageVM,
                        matchInfoVM: dataManageVM.matchInfoVM,
                        homeVM: homeVM
                    )
                    Spacer()
                }
                .background(Color.white)
            }
            VStack(spacing:0) {
                HomeHeaderBar(
                    userVM: userVM,
                    matchInfoVM: dataManageVM.matchInfoVM
                )
                Spacer()
            }
            
            if userVM.showingPopUp {
                UserInfoPopup(
                    dataManageVM: dataManageVM,
                    userVM: userVM
                )
                    .transition(.move(edge: .top))
            }
            if userVM.levelAndModePopUp {
                LevelAndModePopUp(
                    userVM: userVM,
                    matchInfoVM: dataManageVM.matchInfoVM
                )
                .transition(.move(edge: .top))
            }
        }
        .fullScreenCover(isPresented: $homeVM.toPointGameView) {
            MatchTabView(
                dataManageVM: dataManageVM,
                matchInfoVM: dataManageVM.matchInfoVM,
                homeVM: homeVM,
                userVM: userVM
            )
        }
    }
    var winLoseArrayArea: some View {
        HStack{
            Spacer().frame(width: 20)
            ForEach(homeVM.winLoseArray){ dataRow in
                if dataRow.issue == .Win {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:20))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .white, radius: 2)
                } else if dataRow.issue == .Lose {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:20))
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .white, radius: 2)
                } else {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:20))
                        .bold()
                        .foregroundColor(.tungsten)
                        .shadow(color: .white, radius: 2)
                }
                if dataRow.num != homeVM.dateArray.count - 1 {
                    Spacer()
                }
            }
            Spacer().frame(width: 20)
        }
    }
    var dateArrayArea: some View {
        HStack{
            Spacer().frame(width: 20)
            ForEach(homeVM.dateArray){ dataRow in
                Text("\(dataRow.dateString)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                if dataRow.num != homeVM.dateArray.count - 1 {
                    Spacer()
                }
            }
            Spacer().frame(width: 20)
        }
    }
}


