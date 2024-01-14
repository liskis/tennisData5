import SwiftUI
struct GetPointBtn:View {
    @Binding var service: Service
    @Binding var position: Position
    @Binding var myPoint: Int
    @Binding var gameSide: GameSide
    var body: some View {
        Button(action: {
            if position != .NoSelection {
                myPoint += 1
                position = .NoSelection
                service = .first
                gameSide = .noSelection
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
