import SwiftUI
struct WinLoseArrayArea: View {
    var body: some View {
        HStack{
            Spacer()
            WinText()
            Spacer()
            WinText()
            Spacer()
            LoseText()
            Spacer()
            LoseText()
            Spacer()
            WinText()
            Spacer()
        }
    }
}
struct WinText:View {
    var body: some View {
        Text("Win")
            .font(.custom("Verdana",size:23))
            .bold()
            .foregroundColor(.red)
            .shadow(color: .black, radius: 2)
    }
}
struct LoseText:View {
    var body: some View {
        Text("Lose")
            .font(.custom("Verdana",size:23))
            .bold()
            .foregroundColor(.blue)
            .shadow(color: .black, radius: 2)
    }
}
#Preview {
    ContentView()
}
