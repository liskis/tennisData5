import SwiftUI
struct NextBtnArea: View {
    @Environment(\.dismiss) var dismiss
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    @Binding var winCount: Int
    @Binding var loseCount: Int
    @Binding var drowCount: Int
    @Binding var service: Service
    @Binding var position: Position
    var body: some View {
        VStack(spacing:1){
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
                myPoint = 0
                opponentPoint = 0
            }) {
                Text("次のゲームへ")
                .frame(maxWidth: .infinity, maxHeight: 15)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
            Button(action: {
                dismiss()
               
            }) {
                Text("ゲームを終了する")
                .frame(maxWidth: .infinity, maxHeight: 15)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
        }
    }
}
struct NextBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.brown)
        .cornerRadius(5)
    }
}
