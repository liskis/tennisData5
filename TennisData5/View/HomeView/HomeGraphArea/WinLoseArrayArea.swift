import SwiftUI
struct WinLoseArrayArea: View {
    var body: some View {
        HStack{
            Spacer()
            ForEach(HomeGraphData.data1){ data in
                if data.issue == .Win {
                    WinText()
                } else {
                    LoseText()
                }
                Spacer()
            }
        }
    }
}
struct WinText:View {
    var body: some View {
        Text("Win")
            .font(.custom("Verdana",size:23))
            .bold()
            .foregroundColor(.red)
            .shadow(color: .white, radius: 2)
    }
}
struct LoseText:View {
    var body: some View {
        Text("Lose")
            .font(.custom("Verdana",size:23))
            .bold()
            .foregroundColor(.blue)
            .shadow(color: .white, radius: 2)
    }
}
#Preview {
    HomeTabView()
}
