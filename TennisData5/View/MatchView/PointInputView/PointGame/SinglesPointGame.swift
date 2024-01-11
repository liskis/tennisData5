import Foundation
import SwiftUI
struct SinglesPointGame: View {
    let ctl = PointGameInputController()
    let matchId:String = UUID().uuidString
    let setId: String = UUID().uuidString
    let machStartDate: Date = Date()
    var gameId: String = UUID().uuidString
    @Binding var matchFormat: MatchFormat
    @State var service: Service = .first
    @State var position: Position = .NoSelection
    @State var winCount:Int = 0
    @State var loseCount:Int = 0
    @State var myPoint:Int = 0
    @State var opponentPoint:Int = 0
    @State var server: Server = .noSelection
    @State var getPoint: GetPoint = .myTeam
    
//    init(matchFormat: Binding<MatchFormat>) {
//        self._matchFormat = matchFormat
//    }
    var body: some View {
        VStack(spacing:0){
            Spacer().frame(height: 10)
            MyNameAndScoreArea(
                winCount: $winCount,
                loseCount: $loseCount,
                myPoint: $myPoint,
                opponentPoint: $opponentPoint)
            HStack{
                Spacer()
                Text(ctl.inputModeText)
                    .padding(10)
                    .background(.white)
                    .font(.custom("Verdana",size:10))
            }
            ZStack{
                Color.white.ignoresSafeArea()
                VStack{
                    Button(action: {
                        if service == .second {
                            service = .first
                        } else if position != .NoSelection {
                            position = .NoSelection
                        }
                    }) {
                        Text("<< 一つ戻る")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.horizontal, 10)
                    .buttonStyle(GoBackBtnStyle())
                    VStack(spacing:1){
                        HStack(spacing:1){
                            if position == .ServerAdv {
                                Button(action: {
                                    // action
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ServerAdvSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("左のサーバー")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                                .disabled(true)
                            } else {
                                Button(action: {
                                    position = .ServerAdv
                                    server = .player1
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ServerAdvSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("左のサーバー")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyle())
                            }
                            if position == .ServerDuce {
                                Button(action: {
                                    
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ServerDuceSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("右のサーバー")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.trailing, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                                .disabled(true)
                            } else {
                                Button(action: {
                                    position = .ServerDuce
                                    server = .player1
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ServerDuceSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("右のサーバー")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.trailing, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyle())
                            }
                        }
                        HStack(spacing:1){
                            if position == .ReturnerAdv {
                                Button(action: {
                                    
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ReturnerAdvSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("左のリターン")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                                .disabled(true)
                            } else {
                                Button(action: {
                                    position = .ReturnerAdv
                                    server = .player3
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ReturnerAdvSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("左のリターン")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.leading, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyle())
                            }
                            if position == .ReturnerDuce {
                                Button(action: {
                                    
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ReturnerDuceSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("右のリターン")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.trailing, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                                .disabled(true)
                            } else {
                                Button(action: {
                                    position = .ReturnerDuce
                                    server = .player3
                                }) {
                                    HStack(spacing:0){
                                        Spacer()
                                        Image("ReturnerDuceSngls")
                                            .resizable()
                                            .frame(width: 35,height: 35)
                                        Text("右のリターン")
                                            .frame(maxWidth: .infinity, maxHeight: 15)
                                        Spacer()
                                    }
                                }
                                .padding(.trailing, 10)
                                .buttonStyle(SinglesSelectPositionBtnStyle())
                            }
                        }
                    }
                    Spacer().frame(height: 10)
                    VStack{
                        if service == .first {
                            Button(action: {
                                if position != .NoSelection {
                                    service = .second
                                }
                            }) {
                                Text("フォルト")
                                    .frame(maxWidth: .infinity, maxHeight: 15)
                            }
                            .padding(.horizontal, 10)
                            .buttonStyle(FaultBtnStyle())
                        } else {
                            Button(action: {
                                if position == .ServerAdv
                                    || position == .ServerDuce {
                                    opponentPoint += 1
                                    getPoint = .opponent
                                } else if position == .ReturnerAdv
                                            || position == .ReturnerDuce {
                                    myPoint += 1
                                    getPoint = .myTeam
                                }
                                ctl.scoreRecord(
                                    matchFormat: .singles,
                                    pointInputBtn: .doubleFault,
                                    service: service,
                                    position: position,
                                    matchId: matchId,
                                    setId: setId,
                                    gameId: gameId,
                                    server: server,
                                    getPoint: getPoint
                                )
                                position = .NoSelection
                                service = .first
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
                                    // action
                                }) {
                                    Text("ポイントをとった")
                                        .frame(maxWidth: .infinity, maxHeight: 15)
                                }
                                .padding(.leading, 10)
                                .buttonStyle(GetPointBtnStyle())
                                Button(action: {
                                    // action
                                }) {
                                    Text("ポイントをとられた")
                                        .frame(maxWidth: .infinity, maxHeight: 15)
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
                    NextBtnArea()
                }
            }
        }
    }
}
