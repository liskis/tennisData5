import SwiftUI
struct DoubleFaultBtn:View {
    @Binding var service: Service
    @Binding var position: Position
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    @Binding var gameSide: GameSide
    var body: some View {
        Button(action: {
            if position == .ServerDuce || position == .ServerAdv {
                opponentPoint += 1
            } else if position == .ReturnerDuce || position == .ReturnerAdv {
                myPoint += 1
            }
            position = .NoSelection
            service = .first
            gameSide = .noSelection
        },label:{
            Text("ダブルフォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.purple}
                .cornerRadius(4)
        })
    }
}
