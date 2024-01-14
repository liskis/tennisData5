import SwiftUI
struct FaultBtn:View {
    @Binding var service: Service
    @Binding var position: Position
    var body: some View {
        Button(action: {
            if position != .NoSelection {
                service = .second
            }
        },label:{
            Text("フォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.cyan}
                .cornerRadius(4)
        })
    }
}
