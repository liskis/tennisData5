import SwiftUI
struct ServerAdvSngls:View {
    @Binding var position: Position
    @Binding var gameSide: GameSide
    var body: some View {
        if position == .ServerAdv {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nバックサイド")
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
                position = .ServerAdv
                gameSide = .serviceGame
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nバックサイド")
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
