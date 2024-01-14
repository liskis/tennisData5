import Foundation
import SwiftUI
struct SinglesPointGame: View {
    @StateObject var pointInputModel = PointInputModel()
    @State var matchFormat:MatchFormat = .singles
    @State var gameType:GameType = .pointGame
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor.black
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                Spacer().frame(height: 20)
                MyNameAndScoreArea(
                    matchFormat: $matchFormat,
                    myPoint: $pointInputModel.myPoint,
                    opponentPoint: $pointInputModel.opponentPoint,
                    winCount: $pointInputModel.winCount,
                    loseCount: $pointInputModel.loseCount,
                    drowCount: $pointInputModel.drowCount
                )
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
                        Spacer().frame(width: 10)
                        GoBackBtn(
                            gameSide: $pointInputModel.gameSide,
                            service: $pointInputModel.service,
                            position: $pointInputModel.position
                        )
                        Spacer()
                    }
                    Spacer().frame(height: 10)
                    HStack(spacing:1){
                        Spacer().frame(width: 10)
                        ServerAdvSngls(
                            position: $pointInputModel.position,
                            gameSide: $pointInputModel.gameSide
                        )
                        ServerDuceSngls(
                            position: $pointInputModel.position,
                            gameSide: $pointInputModel.gameSide
                        )
                        Spacer().frame(width: 10)
                    }
                    HStack(spacing:1){
                        Spacer().frame(width: 10)
                        ReturnerAdvSngls(
                            position: $pointInputModel.position,
                            gameSide: $pointInputModel.gameSide
                        )
                        ReturnerDuceSngls(
                            position: $pointInputModel.position,
                            gameSide: $pointInputModel.gameSide
                        )
                        Spacer().frame(width: 10)
                    }
                    Spacer().frame(height: 10)
                    if pointInputModel.position != .NoSelection {
                        HStack(){
                            Spacer().frame(width:10)
                            if pointInputModel.service == .first {
                                FaultBtn(
                                    service: $pointInputModel.service,
                                    position: $pointInputModel.position
                                )
                            } else {
                                DoubleFaultBtn(
                                    service: $pointInputModel.service,
                                    position: $pointInputModel.position,
                                    myPoint: $pointInputModel.myPoint,
                                    opponentPoint: $pointInputModel.opponentPoint,
                                    gameSide: $pointInputModel.gameSide
                                )
                            }
                            Spacer().frame(width:10)
                        }
                        
                        Spacer().frame(height: 10)
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            GetPointBtn(
                                service: $pointInputModel.service,
                                position: $pointInputModel.position,
                                myPoint: $pointInputModel.myPoint,
                                gameSide: $pointInputModel.gameSide
                            )
                            LostPointBtn(
                                service: $pointInputModel.service,
                                position: $pointInputModel.position,
                                opponentPoint: $pointInputModel.opponentPoint,
                                gameSide: $pointInputModel.gameSide
                            )
                            Spacer().frame(width:10)
                        }
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            MyWinnerBtn()
                            OpponentWinerBtn()
                            Spacer().frame(width:10)
                        }
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            OpponentMissBtn()
                            MyMissBtn()
                            Spacer().frame(width:10)
                        }
                    }
                    Spacer().frame(height: 10)
                    HStack{
                        Spacer().frame(width:10)
                        NextGameBtn(
                            myPoint: $pointInputModel.myPoint,
                            opponentPoint: $pointInputModel.opponentPoint,
                            winCount: $pointInputModel.winCount,
                            loseCount: $pointInputModel.loseCount,
                            drowCount: $pointInputModel.drowCount,
                            service: $pointInputModel.service,
                            position: $pointInputModel.position,
                            gameSide: $pointInputModel.gameSide
                        )
                        Spacer().frame(width:10)
                    }
                    HStack{
                        Spacer().frame(width:10)
                        GameEndBtn()
                        Spacer().frame(width:10)
                    }
                }
                .background{ Color.white}
                Spacer()
            }
            .background{ Color.mercury }
            .navigationBarTitle("シングルスポイントゲーム")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    HomeTabView()
}
