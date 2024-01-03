import SwiftUI
struct PointInputView: View {
    @Binding var gameType: String
    @Environment(\.dismiss) var dismiss
    init(gameType: Binding<String>) {
        self._gameType = gameType
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    let pointInputCtl = PointInputController()
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.ignoresSafeArea()
                VStack(spacing:0){
                    Spacer().frame(height: 10)
                    NameAndScoreArea()
                    HStack{
                        Spacer()
                        Text(pointInputCtl.inputModeText)
                            .padding(10)
                            .background(.white)
                            .font(.custom("Verdana",size:10))
                    }
                    ZStack{
                        Color.white.ignoresSafeArea()
                        VStack{
                            Spacer()
                            SelectPositionArea()
                            Spacer().frame(height: 10)
                            PointBtnArea()
                        }
                    }
                    

                    Button() {
                        dismiss()
                    } label: {
                        Text("閉じる")
                    }
                    Spacer()
                }
            }
            .navigationBarTitle(
                pointInputCtl.naviTitle(gameType: gameType),
                displayMode: .inline
            )
        }
    } // body
} // PointInputView
struct PointBtnArea:View {
    var body: some View {
        VStack{
            FaultBtn()
            Spacer().frame(height: 10)
            VStack(spacing:1){
                HStack(spacing:40){
                    GetPointBtn()
                    LostPointBtn()
                }
                HStack(spacing:40){
                    MyWinnerBtn()
                    OpponentWinerBtn()
                }
                HStack(spacing:40){
                    OpponetMissBtn()
                    MyMissBtn()
                }
            }
            Spacer()
        }
    }
}

struct FaultBtn:View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("フォルト")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.horizontal, 10)
        .buttonStyle(FaultBtnStyle())
    }
}
struct GetPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとった")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(GetPointBtnStyle())
    }
}
struct LostPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとられた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(LostPointBtnStyle())
    }
}
struct MyWinnerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分が決めた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MyWinnerBtnStyle())
    }
}
struct OpponentWinerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手が決めた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(OpponentWinerBtnStyle())
    }
}
struct OpponetMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手のミス")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(OpponetMissBtnStyle())
    }
}
struct MyMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分のミス")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(MyMissBtnStyle())
    }
}
//Style
struct FaultBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.purple)
        .cornerRadius(5)
    }
}
struct GetPointBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.red)
        .cornerRadius(5)
  }
}
struct LostPointBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.blue)
          .cornerRadius(5)
    }
}
struct MyWinnerBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.red)
          .cornerRadius(5)
    }
}
struct OpponentWinerBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.blue)
          .cornerRadius(5)
    }
}
struct OpponetMissBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.red)
          .cornerRadius(5)
    }
}
struct MyMissBtnStyle: ButtonStyle {
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


