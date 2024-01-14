import SwiftUI

struct GameStartBtnsArea: View {
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                SinglesPointGameBtn()
                DoublesPointgameBtn()
            }
            HStack(spacing:1){
                SetMatchBtn()
                TieBreakBtn()
            }
            HStack(spacing:1){
                PointGameFromCoach()
                SetMatchFromCoach()
            }
        }
    }
}

struct SinglesPointGameBtn: View {
    @EnvironmentObject var pointInputModel: PointInputModel
    @State var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("シングルスで")
                Text("ポイントゲーム")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView()
                .onAppear{
                    pointInputModel.matchId = UUID().uuidString
                    pointInputModel.setId = UUID().uuidString
                    pointInputModel.gameId = UUID().uuidString
                    pointInputModel.machStartDate = Date()
                    pointInputModel.matchFormat = .singles
                    pointInputModel.gameType = .pointGame
                    pointInputModel.gameSide = .noSelection
                    pointInputModel.service = .first
                    pointInputModel.position = .NoSelection
                    pointInputModel.winCount = 0
                    pointInputModel.loseCount = 0
                    pointInputModel.drowCount = 0
                    pointInputModel.myPoint = 0
                    pointInputModel.opponentPoint = 0
                    pointInputModel.server = .noSelection
                    pointInputModel.getPoint = .myTeam
                }
        }
    }
}
struct DoublesPointgameBtn: View {
    @EnvironmentObject var pointInputModel: PointInputModel
    @State var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("ダブルスで")
                Text("ポイントゲーム")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
            
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView()
                .onAppear{
                    pointInputModel.matchId = UUID().uuidString
                    pointInputModel.setId = UUID().uuidString
                    pointInputModel.gameId = UUID().uuidString
                    pointInputModel.machStartDate = Date()
                    pointInputModel.matchFormat = .doubles
                    pointInputModel.gameType = .pointGame
                    pointInputModel.gameSide = .noSelection
                    pointInputModel.service = .first
                    pointInputModel.position = .NoSelection
                    pointInputModel.winCount = 0
                    pointInputModel.loseCount = 0
                    pointInputModel.drowCount = 0
                    pointInputModel.myPoint = 0
                    pointInputModel.opponentPoint = 0
                    pointInputModel.server = .noSelection
                    pointInputModel.getPoint = .myTeam
                }
               
        }
    }
}

struct SetMatchBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            VStack{
                Text("セットマッチ")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(DisabledBtnStyle())
        .disabled(true)
    }
}
struct TieBreakBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            VStack{
                Text("タイブレーク")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(DisabledBtnStyle())
        .disabled(true)
    }
}
struct PointGameFromCoach: View {
    var body: some View {
        
        Button(action: {
                // action
        }) {
            VStack{
                Text("コーチ目線で")
                Text("ポイントゲーム")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(DisabledBtnStyle())
        .disabled(true)
    }
}
struct SetMatchFromCoach: View {
    var body: some View {
        
        Button(action: {
                // action
        }) {
            VStack{
                Text("コーチ目線で")
                Text("セットマッチ")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(DisabledBtnStyle())
        .disabled(true)
    }
}
struct MatchStartBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.ocean)
        .cornerRadius(5)
    }
}
struct DisabledBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.gray)
        .cornerRadius(5)
    }
}

#Preview {
    HomeTabView()
}
