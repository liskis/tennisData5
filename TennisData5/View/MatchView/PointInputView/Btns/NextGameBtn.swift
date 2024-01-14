import SwiftUI
struct NextGameBtn:View {
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    @Binding var winCount: Int
    @Binding var loseCount: Int
    @Binding var drowCount: Int
    @Binding var service: Service
    @Binding var position: Position
    @Binding var gameSide: GameSide
    var body: some View {
        Button(action: {
            if myPoint > opponentPoint {
                winCount += 1
            } else if myPoint < opponentPoint {
                loseCount += 1
            } else if myPoint == opponentPoint {
                drowCount += 1
            }
            service = .first
            position = .NoSelection
            gameSide = .noSelection
            myPoint = 0
            opponentPoint = 0
        },label:{
            Text("次のゲームへ")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.brown}
                .cornerRadius(4)
        })
    }
}
