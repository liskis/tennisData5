import SwiftUI
struct StatsDataArea: View {
    @ObservedObject var homeDataVM: HomeDataViewModel
    var body: some View {
        HStack(alignment: .bottom){
            Spacer()
            winningRate
            Spacer()
//            firstServeRate
            keepRate
            Spacer()
//            secondServeRate
            breakRate
            Spacer()
        }
    }
    var winningRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                if homeDataVM.winningRate == "100.0" {
                    Text(homeDataVM.winningRate)
                        .font(.custom("Verdana",size:30))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                } else {
                    Text(homeDataVM.winningRate)
                        .font(.custom("Verdana",size:35))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                }
                Text("%")
                    .font(.custom("Verdana",size:16))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Text(homeDataVM.winningCount)
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
    var firstServeRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text(homeDataVM.firstSvInRate)
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
            Text(homeDataVM.firstSvInCount)
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
    var secondServeRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text(homeDataVM.secondSvInRate)
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
            Text(homeDataVM.secondSvInCount)
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
    var keepRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text(homeDataVM.keepRate)
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
            Text(homeDataVM.keepCount)
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            Text("サービスキープ率")
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            
        }
    }
    var breakRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                Text(homeDataVM.breakRate)
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
            Text(homeDataVM.breakRate)
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            Text("ブレーク率")
                .font(.custom("Verdana",size:14))
                .bold()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
            
        }
    }
}
