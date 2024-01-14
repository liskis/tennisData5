import SwiftUI
struct LostPointBtn:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        Button(action: {
            if pointInputModel.position != .NoSelection {
                pointInputModel.opponentPoint += 1
                pointInputModel.position = .NoSelection
                pointInputModel.service = .first
                pointInputModel.gameSide = .noSelection
            }
        },label:{
            Text("ポイントをとられた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.blue}
                .cornerRadius(4)
        })
    }
}
