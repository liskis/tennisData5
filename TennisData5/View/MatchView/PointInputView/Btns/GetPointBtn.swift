import SwiftUI
struct GetPointBtn:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        Button(action: {
            if pointInputModel.position != .NoSelection {
                pointInputModel.myPoint += 1
                pointInputModel.position = .NoSelection
                pointInputModel.service = .first
                pointInputModel.gameSide = .noSelection
            }
        },label:{
            Text("ポイントをとった")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.red}
                .cornerRadius(4)
        })
    }
}
