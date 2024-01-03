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
        }
    }
}
struct SinglesPointGameBtn: View {
    @State var isPresented: Bool = false
    @State var gameType: String = "singlesPointGame"
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("シングルスで")
                Text("ポイントゲームを始める")
            }
            .frame(maxWidth: .infinity, minHeight: 35)
            
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchView(gameType: $gameType)
        }
    }
}
struct DoublesPointgameBtn: View {
    @State var isPresented: Bool = false
    @State var gameType = "doublesPointGame"
    var body: some View {
        Button(action: {
            isPresented = true
        }) {
            VStack{
                Text("ダブルスで")
                Text("ポイントゲームを始める")
            }
            .frame(maxWidth: .infinity, minHeight: 35)
            
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchView(gameType: $gameType)
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
            .frame(maxWidth: .infinity, minHeight: 35)
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
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
            .frame(maxWidth: .infinity, minHeight: 35)
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
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

#Preview {
    ContentView()
}
