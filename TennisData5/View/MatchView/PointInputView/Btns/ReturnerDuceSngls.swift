import SwiftUI
struct ReturnerDuceSngls:View {
    @Binding var position: Position
    @Binding var gameSide: GameSide
    var body: some View {
        if position == .ReturnerDuce {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("リターンゲーム\nフォアサイド")
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
                position = .ReturnerDuce
                gameSide = .returnGame
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("リターンゲーム\nフォアサイド")
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
