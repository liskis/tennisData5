import SwiftUI
struct PointInputView: View {
    @Binding var gameType: String
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
                            Spacer().frame(height: 10)
                            NextBtnArea()
                        }
                    }
                    

                    
                }
            }
            .navigationBarTitle(
                pointInputCtl.naviTitle(gameType: gameType),
                displayMode: .inline
            )
        }
    } // body
} // PointInputView

struct NextBtnArea: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:1){
            Button(action: {
                
            }) {
                Text("次のゲームへ")
                .frame(maxWidth: .infinity, minHeight: 30)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
            Button(action: {
                dismiss()
            }) {
                Text("ポイントゲームを終了する")
                .frame(maxWidth: .infinity, minHeight: 30)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
        }
    }
}
struct NextBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.brown)
        .cornerRadius(5)
    }
}

#Preview {
    ContentView()
}


