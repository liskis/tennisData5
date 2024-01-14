import SwiftUI
struct GoBackBtn:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        Button(action: {
            if pointInputModel.service == .second {
                pointInputModel.service = .first
            } else if pointInputModel.position != .NoSelection {
                pointInputModel.position = .NoSelection
            } else if pointInputModel.gameSide != .noSelection {
                pointInputModel.gameSide = .noSelection
            }
        },label: {
            Text("<< 一つ戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(width: 120,height: 40)
                .background{ Color.ocean }
        })
        
        .cornerRadius(4)
    }
}
