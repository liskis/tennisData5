import SwiftUI
struct GameStartBtnsArea: View {
    @State var matchFormat: MatchFormat = .noSelection
    @State var gameType: GameType = .noSelection
    @State var naviTitle: String = ""
    @State var isPresented: Bool = false
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                singlesPointGameBtn
                doublesPointGameBtn
            }
            HStack(spacing:1){
                setMatchBtn
                tieBreakBtn
            }
            HStack(spacing:1){
                pointGameFromCoach
                setMatchFromCoach
            }
        }
    }
    var singlesPointGameBtn: some View {
       
        Button(action: {
            isPresented = true
            matchFormat = .singles
            gameType = .pointGame
            naviTitle = "シングルスポイントゲーム"
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
            MatchTabView(matchFormat: $matchFormat, gameType: $gameType, naviTitle: $naviTitle)
        }
    }
    var doublesPointGameBtn: some View {
        Button(action: {
            isPresented = true
            matchFormat = .doubles
            gameType = .pointGame
            naviTitle = "ダブルスポイントゲーム"
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
            MatchTabView(matchFormat: $matchFormat, gameType: $gameType, naviTitle: $naviTitle)
        }
    }
    var setMatchBtn: some View {
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
    var tieBreakBtn: some View {
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
    var pointGameFromCoach: some View {
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
    var setMatchFromCoach: some View {
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
