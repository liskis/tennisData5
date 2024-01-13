import Foundation
import SwiftUI
struct SinglesPointGame: View {
    @StateObject var pointInputModel = PointInputModel()
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
                Spacer().frame(height: 10)
                MyNameAndScoreArea(
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
                ZStack{
                    Color.white.ignoresSafeArea()
                    VStack{
                        HStack {
                            Button(action: {
                                if pointInputModel.service == .second {
                                    pointInputModel.service = .first
                                } else if pointInputModel.position != .NoSelection {
                                    pointInputModel.position = .NoSelection
                                }
                            }) {
                                Text("<< 一つ戻る")
                                    .frame(maxHeight: 15)
                            }
                            Spacer()
                        }
                        .padding(.horizontal, 10)
                        .buttonStyle(GoBackBtnStyle())
                        SinglesPositionBtnArea(
                            myPoint: $pointInputModel.myPoint,
                            opponentPoint: $pointInputModel.opponentPoint,
                            position: $pointInputModel.position
                        )
                        Spacer().frame(height: 10)
                        VStack{
                            if pointInputModel.service == .first {
                                Button(action: {
                                    if pointInputModel.position != .NoSelection {
                                        pointInputModel.service = .second
                                    }
                                }) {
                                    Text("フォルト")
                                        .frame(maxWidth: .infinity, maxHeight: 15)
                                }
                                .padding(.horizontal, 10)
                                .buttonStyle(FaultBtnStyle())
                            } else {
                                Button(action: {
                                    if pointInputModel.position == .ServerDuce ||
                                        pointInputModel.position == .ServerAdv {
                                        pointInputModel.opponentPoint += 1
                                    } else if pointInputModel.position == .ReturnerDuce ||
                                                pointInputModel.position == .ReturnerAdv {
                                        pointInputModel.myPoint += 1
                                    }
                                    pointInputModel.position = .NoSelection
                                    pointInputModel.service = .first
                                }) {
                                    Text("ダブルフォルト")
                                        .frame(maxWidth: .infinity, maxHeight: 15)
                                }
                                .padding(.horizontal, 10)
                                .buttonStyle(DoubleFaultBtnStyle())
                            }
                            Spacer().frame(height: 10)
                            VStack(spacing:1){
                                HStack(spacing:40){
                                    Button(action: {
                                        if pointInputModel.position != .NoSelection {
                                            pointInputModel.myPoint += 1
                                            pointInputModel.position = .NoSelection
                                            pointInputModel.service = .first
                                        }
                                    }) {
                                        VStack(spacing:1){
                                            Text("ポイントを")
                                                .frame(maxWidth: .infinity, maxHeight: 15)
                                            Text("とった")
                                                .frame(maxWidth: .infinity, maxHeight: 15)
                                        }
                                    }
                                    .padding(.leading, 10)
                                    .buttonStyle(GetPointBtnStyle())
                                    Button(action: {
                                        if pointInputModel.position != .NoSelection {
                                            pointInputModel.opponentPoint += 1
                                            pointInputModel.position = .NoSelection
                                            pointInputModel.service = .first
                                        }
                                    }) {
                                        VStack(spacing:1){
                                            Text("ポイントを")
                                                .frame(maxWidth: .infinity, maxHeight: 15)
                                            Text("とられた")
                                                .frame(maxWidth: .infinity, maxHeight: 15)
                                        }
                                        
                                    }
                                    .padding(.trailing, 10)
                                    .buttonStyle(LostPointBtnStyle())
                                }
                                HStack(spacing:40){
                                    Button(action: {
                                        // action
                                    }) {
                                        Text("自分たちが決めた")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                    }
                                    .padding(.leading, 10)
                                    .buttonStyle(MyWinnerBtnStyle())
                                    .disabled(true)
                                    Button(action: {
                                        // action
                                    }) {
                                        Text("相手が決めた")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                    }
                                    .padding(.trailing, 10)
                                    .buttonStyle(OpponentWinerBtnStyle())
                                    .disabled(true)
                                }
                                HStack(spacing:40){
                                    Button(action: {
                                        // action
                                    }) {
                                        Text("相手のミス")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                    }
                                    .padding(.leading, 10)
                                    .buttonStyle(OpponetMissBtnStyle())
                                    .disabled(true)
                                    Button(action: {
                                        // action
                                    }) {
                                        Text("自分のミス")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                    }
                                    .padding(.trailing, 10)
                                    .buttonStyle(MyMissBtnStyle())
                                    .disabled(true)
                                }
                            }
                        }
                        Spacer().frame(height: 10)
                        NextBtnArea(
                            myPoint: $pointInputModel.myPoint,
                            opponentPoint: $pointInputModel.opponentPoint,
                            winCount: $pointInputModel.winCount,
                            loseCount: $pointInputModel.loseCount,
                            drowCount: $pointInputModel.drowCount,
                            service: $pointInputModel.service,
                            position: $pointInputModel.position
                        )
                    }
                }
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
