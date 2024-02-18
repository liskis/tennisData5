import SwiftUI
struct PointGameScoreArea: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var homeVM: HomeViewModel
    var body: some View {
        VStack(spacing:1){
            HStack{
                Spacer().frame(width: 40)
                Text(String(pointVM.getGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("勝")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.lostGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("負")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.drowGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("分")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Spacer()
            }
            HStack{
                goBackBtn
                Spacer()
                VStack{
                    HStack{
                        Text(String(pointVM.getPoint))
                            .font(.custom("Verdana",size:14))
                            .bold()
                        Text("-")
                            .font(.custom("Verdana",size:6))
                            .bold()
                        Text(String(pointVM.lostPoint))
                            .font(.custom("Verdana",size:14))
                            .bold()
                    }
                }
                Spacer()
                if pointVM.allPoint == 0 {
                    nextGameBtnDis
                } else {
                    nextGameBtn
                }
            }
            HStack{
                Spacer()
                Text(matchInfoVM.inputMode.forString)
                    .foregroundColor(.red)
                    .bold()
                    .padding(4)
                    .font(.custom("Verdana",size:6))
            }
        }
        
    }
    var goBackBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(width: 50,height: 20)
            .overlay{
                Text("<< 戻る")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        dataManageVM.goBack()
                        Task{
                            await dataManageVM.WCGoBack()
                        }
                    }
            }
    }
    var nextGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(width: 50, height: 20)
            .overlay{
                Text("次のゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        dataManageVM.nextGame()
                    }
            }
    }
    var nextGameBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(width: 50, height: 20)
            .overlay{
                Text("次のゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
}
