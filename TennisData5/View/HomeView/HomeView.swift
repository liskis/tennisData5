import SwiftUI
struct HomeView: View {
    let ctl = HomeController()
    @State var data1:[LineGraphData]
    @State var data2:[LineGraphData]
    init(){
        data1 = ctl.data1
        data2 = ctl.data2
    }
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
<<<<<<< HEAD
                        HStack{
                            Spacer()
                            HomeGraphArea(data1:$data1, data2:$data2)
                            Spacer()
                        }
                        
=======
                        HomeGraphArea(data1:$data1, data2:$data2)
>>>>>>> 7f5c7b92233c277265fb174476d2cdc074b1198d
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


