import SwiftUI
struct StatsDataArea: View {
    @ObservedObject var homeVM: HomeViewModel
    var body: some View {
        HStack(alignment: .bottom){
            Spacer()
            winningRate
            Spacer()
            keepRate
            Spacer()
            breakRate
            Spacer()
        }
    }
    var winningRate: some View {
        VStack{
            HStack(alignment: .bottom,spacing:0){
                if homeVM.winningRate == "100.0" {
                    Text(homeVM.winningRate)
                        .font(.custom("Verdana",size:30))
                        .bold()
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                } else {
                    Text(homeVM.winningRate)
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
            Text(homeVM.winningCount)
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
                Text(homeVM.firstSvInRate)
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
            Text(homeVM.firstSvInCount)
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
                Text(homeVM.secondSvInRate)
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
            Text(homeVM.secondSvInCount)
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
                Text(homeVM.keepRate)
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
            Text(homeVM.keepCount)
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
                Text(homeVM.breakRate)
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
            Text(homeVM.breakRate)
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
