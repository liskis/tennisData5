import SwiftUI
struct ServiceGame:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        if pointInputModel.gameSide == .serviceGame {
            Button(action: {
                // NoAction
            },label:{
                Text("サービスゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background{Color.asparagus}
                    .cornerRadius(4)
            })
            .disabled(true)
        } else {
            Button(action: {
                pointInputModel.gameSide = .serviceGame
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
