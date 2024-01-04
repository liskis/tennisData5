import SwiftUI
struct NextBtnArea: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing:1){
            Button(action: {
                
            }) {
                Text("次のゲームへ")
                .frame(maxWidth: .infinity, maxHeight: 15)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
            Button(action: {
                dismiss()
            }) {
                Text("ポイントゲームを終了する")
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
