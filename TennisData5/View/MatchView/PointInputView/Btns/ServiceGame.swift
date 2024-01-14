import SwiftUI
struct ServiceGame:View {
    @Binding var gameSide: GameSide
    var body: some View {
        if gameSide == .serviceGame {
            Button(action: {
                // NoAction
            },label:{
                Text("サービスゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{Color.gray}
                    .cornerRadius(4)
            })
            .disabled(true)
        } else {
            Button(action: {
                gameSide = .serviceGame
            },label:{
                Text("サービスゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{Color.fern}
                    .cornerRadius(4)
            })
        }
    }
}
