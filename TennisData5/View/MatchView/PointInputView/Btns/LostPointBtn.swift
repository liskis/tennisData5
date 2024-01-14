import SwiftUI
struct LostPointBtn:View {
    @Binding var service: Service
    @Binding var position: Position
    @Binding var opponentPoint: Int
    @Binding var gameSide: GameSide
    var body: some View {
        Button(action: {
            if position != .NoSelection {
                opponentPoint += 1
                position = .NoSelection
                service = .first
                gameSide = .noSelection
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
