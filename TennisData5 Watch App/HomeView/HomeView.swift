import SwiftUI

struct HomeView: View {
    let watchHeight = WKInterfaceDevice.current().screenBounds.size.height
    @ObservedObject var dataManageVM = DataManageViewModel()
    @ObservedObject var userVM = UserViewModel()
    @State var naviTitle: String = ""
    @State var isPresented: Bool = false
    var body: some View {
        VStack(spacing: 0){
            headerLogo
            headerBar
            Spacer()
            gameStartBtns
            Spacer()
        }
        .frame(height: watchHeight * 0.9)
        .fullScreenCover(isPresented: $isPresented, onDismiss: {
            dataManageVM.resetAllVM()
        }) {
            PointGameView(
                dataManageVM: dataManageVM,
                pointVM: dataManageVM.pointVM,
                matchInfoVM: dataManageVM.matchInfoVM,
                positionVM: dataManageVM.positionVM,
                chartDataVM: dataManageVM.chartDataVM,
                userVM: userVM
            )
            
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
                        isPresented = true
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
                        isPresented = true
                    }
            }
        }
    }
    
}
