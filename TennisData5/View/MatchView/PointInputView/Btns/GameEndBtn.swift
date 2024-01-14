import SwiftUI
struct GameEndBtn:View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button(action: {
            dismiss()
        },label:{
            Text("ゲームを終了する")
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
