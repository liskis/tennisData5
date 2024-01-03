import SwiftUI
struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing:0) {
                Spacer()
                HomeHeaderBar()
                ZStack {
                    VStack{
                        Image("background2")
                            .resizable()
                            .scaledToFit()
                        Spacer()
                    }
                    VStack{
                        Text("").frame(height: 10)
                        StatsDataArea()
                        Text("").frame(height: 10)
                        HomeGraphArea()
                        WinLoseArrayArea()
                        DateArrayArea()
                        Text("").frame(height: 10)
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                Text("").frame(height: 5)
                                GameStartBtnsArea()
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


