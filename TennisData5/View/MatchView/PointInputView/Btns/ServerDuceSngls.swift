import SwiftUI
struct ServerDuceSngls:View {
    @Binding var position: Position
    @Binding var gameSide: GameSide
    var body: some View {
        if position == .ServerDuce {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nフォアサイド")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 50)
            .background{Color.gray}
            .cornerRadius(4)
            .disabled(true)
        } else {
            Button(action: {
                position = .ServerDuce
                gameSide = .serviceGame
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nフォアサイド")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 50)
            .background{Color.green}
            .cornerRadius(4)
        }
    }
}
