import SwiftUI
struct GameStartBtnsArea: View {
    @ObservedObject var homeDataVM: HomeDataViewModel
    @ObservedObject var userVM: UserViewModel
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
            Text("シングルスで\nポイントゲーム")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView(
                matchFormat: $matchFormat,
                gameType: $gameType,
                naviTitle: $naviTitle,
                homeDataVM: homeDataVM,
                userVM: userVM
            )
        }
    }
    var doublesPointGameBtn: some View {
        Button(action: {
            isPresented = true
            matchFormat = .doubles
            gameType = .pointGame
            naviTitle = "ダブルスポイントゲーム"
        }) {
            Text("ダブルスで\nポイントゲーム")
                .frame(maxWidth: .infinity, minHeight: 30)
            
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
        .fullScreenCover(isPresented: $isPresented) {
            MatchTabView(
                matchFormat: $matchFormat,
                gameType: $gameType,
                naviTitle: $naviTitle,
                homeDataVM: homeDataVM,
                userVM: userVM
            )
        }
    }
    var setMatchBtn: some View {
        Button(action: {
            // action
        }) {
            ZStack{
                Text("セットマッチを\n始める")
                Text("Please wait for update !")
                    .frame(width: 150,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-15))
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
            ZStack{
                Text("タイブレーク\n始める")
                Text("Please wait for update !")
                    .frame(width: 150,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-15))
                    
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
            ZStack{
                Text("コーチ目線で\nポイントゲーム")
                Text("Please wait for update !")
                    .frame(width: 150,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-15))
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
            ZStack{
                Text("コーチ目線で\nセットマッチ")
                Text("Please wait for update !")
                    .frame(width: 150,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 10))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-15))
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
