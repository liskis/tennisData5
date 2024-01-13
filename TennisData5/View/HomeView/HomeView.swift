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
                        Spacer().frame(height: 10)
                        StatsDataArea()
                        Spacer().frame(height: 50)
                        HStack{
                            Spacer()
                            HomeGraphArea()
                            Spacer()
                        }
                        
                        WinLoseArrayArea()
                        DateArrayArea()
                        Spacer().frame(height: 10)
                        ZStack{
                            Color.white.ignoresSafeArea()
                            VStack{
                                Spacer().frame(height: 5)
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
    HomeTabView()
}


