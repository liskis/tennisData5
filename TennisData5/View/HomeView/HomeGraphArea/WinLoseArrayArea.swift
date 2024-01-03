import SwiftUI
struct WinLoseArrayArea: View {
    var body: some View {
        HStack{
            Spacer()
            Text("Win")
                .font(.custom("Verdana",size:23))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2)
            Spacer()
            Text("Win")
                .font(.custom("Verdana",size:23))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2)
            Spacer()
            Text("Lose")
                .font(.custom("Verdana",size:23))
                .bold()
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 2)
            Spacer()
            Text("Lose")
                .font(.custom("Verdana",size:23))
                .bold()
                .foregroundColor(.blue)
                .shadow(color: .black, radius: 2)
            Spacer()
            Text("Win")
                .font(.custom("Verdana",size:23))
                .bold()
                .foregroundColor(.red)
                .shadow(color: .black, radius: 2)
            Spacer()
        }
    }
}
#Preview {
    ContentView()
}
