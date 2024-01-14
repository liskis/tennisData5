import SwiftUI
struct NextGameBtn:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        Button(action: {
            if pointInputModel.myPoint > pointInputModel.opponentPoint {
                pointInputModel.winCount += 1
            } else if pointInputModel.myPoint < pointInputModel.opponentPoint {
                pointInputModel.loseCount += 1
            } else if pointInputModel.myPoint == pointInputModel.opponentPoint {
                pointInputModel.drowCount += 1
            }
            pointInputModel.service = .first
            pointInputModel.position = .NoSelection
            pointInputModel.gameSide = .noSelection
            pointInputModel.myPoint = 0
            pointInputModel.opponentPoint = 0
            pointInputModel.gameId = UUID().uuidString
        },label:{
            Text("次のゲームへ")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        })
    }
}
