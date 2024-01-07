import SwiftUI
struct HomeView: View {
    let ctl = HomeController()
    @State var data1:[LineGraphData] = [
        .init(dateString: "23/12/1", stats: 60, category: "data1"),
        .init(dateString: "23/12/8", stats: 63, category: "data1"),
        .init(dateString: "23/12/15", stats: 70, category: "data1"),
        .init(dateString: "23/12/16", stats: 70, category: "data1"),
        .init(dateString: "23/12/22", stats: 70, category: "data1")
    ]
    @State var data2:[LineGraphData] = [
        .init(dateString: "23/12/1", stats: 90, category: "data2"),
        .init(dateString: "23/12/8", stats: 96, category: "data2"),
        .init(dateString: "23/12/15", stats: 89, category: "data2"),
        .init(dateString: "23/12/16", stats: 96, category: "data2"),
        .init(dateString: "23/12/22", stats: 96, category: "data2")
    ]
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
                        Spacer().frame(height: 20)
                        HomeGraphArea(data1:$data1,data2:$data2)
                        WinLoseArrayArea()
                        DateArrayArea(data1:$data1)
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


