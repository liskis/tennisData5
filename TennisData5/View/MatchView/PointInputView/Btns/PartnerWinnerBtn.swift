import SwiftUI
struct PartnerWinnerBtn:View {
    var body: some View {
        Button(action: {
            
        },label:{
            Text("味方が決めた")
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
