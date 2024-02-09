import SwiftUI
struct HomeView: View {
    @ObservedObject var homeDataVM: HomeDataViewModel
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing:0) {
                HomeHeaderBar(userVM: userVM)
                VStack(spacing:0){
                    Spacer().frame(height: 10)
                    StatsDataArea(
                        homeDataVM: homeDataVM
                    )
                    .clipped()
                    Spacer().frame(height: 10)
                    LineChartView(
                        valueData: $homeDataVM.firstSvInChartData,
                        signPost: $homeDataVM.signPost
                    )
                    LineChartView(
                        valueData: $homeDataVM.doubleFaultRateChartData,
                        signPost: $homeDataVM.signPost
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
                        homeDataVM: homeDataVM,
                        userVM: userVM
                    )
                    Spacer()
                }
                .background(Color.white)
                
            }
            if userVM.showingPopUp {
                UserInfoPopup(userVM: userVM)
            }
            if userVM.levelAndModePopUp {
                LevelAndModePopUp(
                    userVM: userVM
                )
            }
        }
    }
    var winLoseArrayArea: some View {
        HStack{
            Spacer().frame(width: 20)
            ForEach(homeDataVM.winLoseArray){ dataRow in
                if dataRow.issue == .Win {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.red)
                        .shadow(color: .white, radius: 2)
                } else if dataRow.issue == .Lose {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.blue)
                        .shadow(color: .white, radius: 2)
                } else {
                    Text(dataRow.issue.rawValue)
                        .font(.custom("Verdana",size:23))
                        .bold()
                        .foregroundColor(.tungsten)
                        .shadow(color: .white, radius: 2)
                }
                if dataRow.num != homeDataVM.dateArray.count - 1 {
                    Spacer()
                }
            }
            Spacer().frame(width: 20)
        }
    }
    var dateArrayArea: some View {
        HStack{
            Spacer().frame(width: 20)
            ForEach(homeDataVM.dateArray){ dataRow in
                Text("\(dataRow.dateString)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                if dataRow.num != homeDataVM.dateArray.count - 1 {
                    Spacer()
                }
            }
            Spacer().frame(width: 20)
        }
    }
}


