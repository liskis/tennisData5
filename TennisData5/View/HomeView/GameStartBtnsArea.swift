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
    @State var isPresented: Bool = false
    @State var gameType: GameType = .pointGame
    @State var matchFormat: MatchFormat = .singles
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("シングルスで")
                Text("ポイントゲームを始める")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView(matchFormat: $matchFormat, gameType: $gameType)
        }
    }
}
struct DoublesPointgameBtn: View {
    @State var isPresented: Bool = false
    @State var gameType: GameType = .pointGame
    @State var matchFormat: MatchFormat = .doubles
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("ダブルスで")
                Text("ポイントゲームを始める")
            }
            .frame(maxWidth: .infinity, minHeight: 30)
            
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView(matchFormat: $matchFormat, gameType: $gameType)
        }
    }
}
struct SetMatchBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            VStack{
                Text("セットマッチを")
                Text("始める")
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
                Text("タイブレークを")
                Text("始める")
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
        .background(configuration.isPressed ? Color.primary : Color.blue)
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
