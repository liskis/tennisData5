import SwiftUI
struct NextBtnArea: View {
    @Environment(\.dismiss) var dismiss
<<<<<<< HEAD
    let ctl = PointGameInputController()
=======
    let ctl = SnglsPintGmPointInputController()
>>>>>>> 7f5c7b92233c277265fb174476d2cdc074b1198d
    var body: some View {
        VStack(spacing:1){
            Button(action: {
                ctl.deleteAll()
            }) {
                Text("データを削除")
                .frame(maxWidth: .infinity, maxHeight: 15)
            }
            .padding(.horizontal, 10)
            .buttonStyle(NextBtnStyle())
            Button(action: {
//                dismiss()
                ctl.printAll()
            }) {
                Text("データを表示")
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
