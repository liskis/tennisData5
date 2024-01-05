import SwiftUI
struct PointInputView: View {
    let ctl = PointInputController()
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
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.ignoresSafeArea()
                if gameType == "singlesPointGame" {
                    VStack(spacing:0){
                        Spacer().frame(height: 10)
                        MyNameAndScoreArea()
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
                                SnglsSelectPositionArea()
                                Spacer().frame(height: 10)
                                PointBtnArea()
                                Spacer().frame(height: 10)
                                NextBtnArea()
                            }
                        }
                    }
                } else if gameType == "doublesPointGame" {
                    VStack(spacing:0){
                        Spacer().frame(height: 10)
                        MyNameAndScoreArea()
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
                                Spacer().frame(height: 10)
                                DblsSelectPositionArea()
                                Spacer().frame(height: 10)
                                PointBtnArea()
                                Spacer().frame(height: 10)
                                NextBtnArea()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(
                ctl.naviTitle(gameType: gameType),
                displayMode: .inline
            )
        }
    } // body
} // PointInputView



    



#Preview {
    ContentView()
}


