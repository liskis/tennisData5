
import SwiftUI

struct HomeView: View {

    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var homeVM: HomeViewModel
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    
    var body: some View {
        ZStack{
            VStack(spacing: 5){
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
            if homeVM.toPointGameView {
                PointGameView(
                    dataManageVM: dataManageVM,
                    pointVM: dataManageVM.pointVM,
                    matchInfoVM: dataManageVM.matchInfoVM,
                    positionVM: dataManageVM.positionVM,
                    chartDataVM: dataManageVM.chartDataVM,
                    userVM: userVM,
                    homeVM: homeVM,
                    coreMotionVM: dataManageVM.coreMotionVM
                )
                .transition(.move(edge: .bottom))
            }
        }
    }
    
    private var headerLogo: some View{
        HStack{
            Spacer().frame(width: 10)
            Image(.logo)
                .resizable()
                .scaledToFit()
            Spacer()
        }
        .frame(height: 20)
    }
    
    private var headerBar: some View {
        HStack(spacing:0) {
            Spacer()
            Image(.angleG)
                .resizable()
                .scaledToFit()
            Text(userVM.myName + " さん")
                .font(.custom("Verdana",size:8))
                .bold()
                .foregroundColor(.white)
                .frame(height:24)
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
            .frame(height:24)
            .background(.white)
            .clipped()
        }
        .frame(height: 24)
    }
    
    private var latestMatch: some View {
        HStack{
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
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(Color.red)
                    .bold()
            } else if homeVM.latestMatch.WinScore < homeVM.latestMatch.LoseScore {
                Text("Lose")
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(Color.blue)
                    .bold()
            } else {
                Text("Drow")
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(Color.silver)
                    .bold()
            }
        }
        .frame(height: 14)
    }
    
    private var gameStartBtns: some View {
        VStack(spacing:1){
            RoundedRectangle(cornerRadius: 2)
                .fill(.ocean)
                .frame(height: 50)
                .overlay{
                    VStack {
                        Text("シングルス")
                        Text("ポイントゲーム")
                    }
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .onTapGesture {
                        
                        dataManageVM.toSinglesPointGame()
                    }
                }
            RoundedRectangle(cornerRadius: 2)
                .fill(.ocean)
                .frame(height: 50)
                .overlay{
                    VStack {
                        Text("ダブルス")
                        Text("ポイントゲーム")
                    }
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .onTapGesture {
                        
                        dataManageVM.toDoublesPointGame()
                    }
                }
        }
        .padding(.horizontal,10)
    }
}
