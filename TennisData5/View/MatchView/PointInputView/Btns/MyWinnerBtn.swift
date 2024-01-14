import SwiftUI
struct MyWinnerBtn:View {
    var body: some View {
        Button(action: {
            
        },label:{
            Text("自分が決めた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.gray}
                .cornerRadius(4)
        })
        .disabled(true)
    }
}
