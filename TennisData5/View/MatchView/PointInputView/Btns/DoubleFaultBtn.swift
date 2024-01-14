import SwiftUI
struct DoubleFaultBtn:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        Button(action: {
            if pointInputModel.position == .ServerDuce ||
                pointInputModel.position == .ServerAdv ||
                pointInputModel.position == .VolleyerDurServAdv ||
                pointInputModel.position == .VolleyerDurServDuce
            {
                pointInputModel.opponentPoint += 1
            } else if pointInputModel.position == .ReturnerDuce ||
                        pointInputModel.position == .ReturnerAdv ||
                        pointInputModel.position == .VolleyerDurRetAdv ||
                        pointInputModel.position == .VolleyerDurRetDuce
            {
                pointInputModel.myPoint += 1
            }
            pointInputModel.position = .NoSelection
            pointInputModel.service = .first
            pointInputModel.gameSide = .noSelection
        },label:{
            Text("ダブルフォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.grape}
                .cornerRadius(4)
        })
    }
}
