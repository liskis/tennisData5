import SwiftUI
struct DblsGoBackBtn:View {
    @Binding var gameSide: GameSide
    @Binding var service:Service
    @Binding var position: Position
    var body: some View {
        Button(action: {
            if service == .second {
                service = .first
            } else if position != .NoSelection {
                position = .NoSelection
            } else if gameSide != .noSelection {
                gameSide = .noSelection
            }
        },label: {
            Text("<< 一つ戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
        })
        .frame(width: 120,height: 40)
        .background{ Color.brown }
        .cornerRadius(4)
    }
}
