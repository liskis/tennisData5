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
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.ignoresSafeArea()
                if gameType == "singlesPointGame" {
                    VStack(spacing:0){
                        Spacer().frame(height: 10)
                        NameAndScoreArea()
                        HStack{
                            Spacer()
                            Text(PointInputController.inputModeText)
                                .padding(10)
                                .background(.white)
                                .font(.custom("Verdana",size:10))
                        }
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                SelectPositionArea()
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
                        NameAndScoreArea()
                        HStack{
                            Spacer()
                            Text(PointInputController.inputModeText)
                                .padding(10)
                                .background(.white)
                                .font(.custom("Verdana",size:10))
                        }
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                Spacer().frame(height: 10)
                                DoublesSelectPositionArea()
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
                PointInputController.naviTitle(gameType: gameType),
                displayMode: .inline
            )
        }
    } // body
} // PointInputView



    struct DoublesSelectPositionArea: View {
        var body: some View {
            VStack(spacing:1){
                HStack(spacing:1){
                    Button(action: {
                        // action
                    }) {
                        Text("左のサーバー")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    Button(action: {
                        // action
                    }) {
                        Text("右のサーバー")
                        .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                }
                HStack(spacing:1){
                    Button(action: {
                        // action
                    }) {
                        VStack(spacing:10){
                            Text("サービスゲームの")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                            Text("左ボレーヤー")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                        }
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    Button(action: {
                        // action
                    }) {
                        VStack(spacing:10){
                            Text("サービスゲームの")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                            Text("右ボレーヤー")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                        }
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                }
                HStack(spacing:1){
                    Button(action: {
                        // action
                    }) {
                        VStack(spacing:10){
                            Text("リターンゲームの")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                            Text("左ボレーヤー")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                        }
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    Button(action: {
                        // action
                    }) {
                        VStack(spacing:10){
                            Text("リターンゲームの")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                            Text("右ボレーヤー")
                                .frame(maxWidth: .infinity, maxHeight: 5)
                        }
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                }
                HStack(spacing:1){
                    Button(action: {
                        // action
                    }) {
                        Text("左のリターン")
                        .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    Button(action: {
                        // action
                    }) {
                        Text("右のリターン")
                        .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                }
            }
        }
    }




#Preview {
    ContentView()
}


