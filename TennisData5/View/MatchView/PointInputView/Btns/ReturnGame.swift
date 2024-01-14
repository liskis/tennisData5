import SwiftUI
struct ReturnGame:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        if pointInputModel.gameSide == .returnGame {
            Button(action: {
                // NoAction
            },label:{
                Text("リターンゲーム")
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
                pointInputModel.gameSide = .returnGame
            },label:{
                Text("リターンゲーム")
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
