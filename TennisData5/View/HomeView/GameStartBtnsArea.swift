import SwiftUI
struct GameStartBtnsArea: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var homeVM: HomeViewModel
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                singlesPointGameBtn
                doublesPointGameBtn
            }
            ZStack{
                VStack(spacing:1){
                    HStack(spacing:1){
                        setMatchBtn
                        tieBreakBtn
                    }
                    HStack(spacing:1){
                        pointGameFromCoach
                        setMatchFromCoach
                    }
                }
                Text("Please wait for update !")
                    .frame(width: 180,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-10))
            }
        }
    }
    var singlesPointGameBtn: some View {
        Button(action: {
            matchInfoVM.matchFormat = .singles
            matchInfoVM.gameType = .pointGame
            matchInfoVM.matchId = UUID().uuidString
            matchInfoVM.setId = UUID().uuidString
            matchInfoVM.gameId = UUID().uuidString
            matchInfoVM.naviTitle = "シングルスポイントゲーム"
            Task{
                await dataManageVM.WCToMatchView()
            }
            homeVM.toPointGameView = true
        }) {
            Text("シングルスで\nポイントゲーム")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MatchStartBtnStyle())
        
    }
    var doublesPointGameBtn: some View {
        Button(action: {
            matchInfoVM.matchFormat = .doubles
            matchInfoVM.gameType = .pointGame
            matchInfoVM.matchId = UUID().uuidString
            matchInfoVM.setId = UUID().uuidString
            matchInfoVM.gameId = UUID().uuidString
            matchInfoVM.naviTitle = "ダブルスポイントゲーム"
            Task{
                await dataManageVM.WCToMatchView()
            }
            homeVM.toPointGameView = true
        }) {
            Text("ダブルスで\nポイントゲーム")
                .frame(maxWidth: .infinity, minHeight: 30)
            
        }
        .padding(.trailing, 10)
        .buttonStyle(MatchStartBtnStyle())
        
    }
    var setMatchBtn: some View {
        Button(action: {
            // action
        }) {
            Text("セットマッチを\n始める")
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
            Text("タイブレーク\n始める")
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
            Text("コーチ目線で\nポイントゲーム")
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
            Text("コーチ目線で\nセットマッチ")
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
