import SwiftUI
struct StatsDataArea: View {
    var body: some View {
        HStack(alignment: .bottom){
            Spacer()
            WinningRate()
            Spacer()
            FirstServeRate()
            Spacer()
            SecondServeRate()
            Spacer()
        }
    }
}
struct WinningRate: View {
    var body: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text("46.7")
                    .font(.custom("Verdana",size:35))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                Text("%")
                    .font(.custom("Verdana",size:16))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Text("(5/17)")
                .font(.custom("Verdana",size:16))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            Text("勝率")
                .font(.custom("Verdana",size:16))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
        }
    }
}
struct FirstServeRate: View {
    var body: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text("42.2")
                    .font(.custom("Verdana",size:30))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                Text("%")
                    .font(.custom("Verdana",size:14))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Text("(76/180)")
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            HStack(alignment: .center){
                Text("●")
                    .font(.custom("Verdana",size:18))
                    .bold()
                    .foregroundColor(.orange)
                    .shadow(color: .black, radius: 2)
                Text("1stサーブin")
                    .font(.custom("Verdana",size:14))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
        }
    }
}
struct SecondServeRate: View {
    var body: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text("42.2")
                    .font(.custom("Verdana",size:30))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
                Text("%")
                    .font(.custom("Verdana",size:14))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Text("(76/180)")
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            HStack(alignment: .center){
                Text("●")
                    .font(.custom("Verdana",size:18))
                    .bold()
                    .foregroundColor(.red)
                    .shadow(color: .black, radius: 2)
                Text("2ndサーブin")
                    .font(.custom("Verdana",size:14))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
        }
    }
}

#Preview {
    HomeTabView()
}
