import SwiftUI
struct SelectPositionArea: View {
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                Button(action: {
                    // action
                }) {
                    Text("左のサーバー")
                    .frame(maxWidth: .infinity, minHeight: 30)
                }
                .padding(.leading, 10)
                .buttonStyle(SelectPositionBtnStyle())
                Button(action: {
                    // action
                }) {
                    Text("右のサーバー")
                    .frame(maxWidth: .infinity, minHeight: 30)
                }
                .padding(.trailing, 10)
                .buttonStyle(SelectPositionBtnStyle())
            }
            HStack(spacing:1){
                Button(action: {
                    // action
                }) {
                    Text("左のリターン")
                    .frame(maxWidth: .infinity, minHeight: 30)
                }
                .padding(.leading, 10)
                .buttonStyle(SelectPositionBtnStyle())
                Button(action: {
                    // action
                }) {
                    Text("右のリターン")
                    .frame(maxWidth: .infinity, minHeight: 30)
                }
                .padding(.trailing, 10)
                .buttonStyle(SelectPositionBtnStyle())
            }
        }
    }
}
struct SelectPositionBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.green)
        .cornerRadius(5)
    }
}
