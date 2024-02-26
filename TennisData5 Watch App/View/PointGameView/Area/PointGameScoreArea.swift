
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
            winLoseArea
            HStack{
                goBackBtn
                Spacer()
                VStack{
                    getAndLostPointArea
                }
                Spacer()
                if pointVM.allPoint == 0 {
                    nextGameBtnDis
                } else {
                    nextGameBtn
                }
            }
        }
    }
    
    private var winLoseArea: some View {
        HStack{
            Spacer().frame(width: 40)
            Text(String(pointVM.getGameCount))
                .font(.custom("Verdana",size:12))
                .bold()
            Text("勝")
                .font(.custom("Verdana",size:8))
                .bold()
            Text(String(pointVM.lostGameCount))
                .font(.custom("Verdana",size:12))
                .bold()
            Text("負")
                .font(.custom("Verdana",size:8))
                .bold()
            Text(String(pointVM.drowGameCount))
                .font(.custom("Verdana",size:12))
                .bold()
            Text("分")
                .font(.custom("Verdana",size:8))
                .bold()
            Spacer()
        }
    }
    
    private var getAndLostPointArea: some View {
        HStack{
            Text(String(pointVM.getPoint))
                .font(.custom("Verdana",size:16))
                .bold()
            Text("-")
                .font(.custom("Verdana",size:16))
                .bold()
            Text(String(pointVM.lostPoint))
                .font(.custom("Verdana",size:16))
                .bold()
        }
    }
    
    private var goBackBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(width: 60,height: 20)
            .overlay{
                Text("<< 戻る")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
                    .onTapGesture {
                        dataManageVM.goBack()
                        Task{
                            await dataManageVM.WCGoBack()
                        }
                    }
            }
    }
    
    private var nextGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.ocean)
            .frame(width: 60, height: 20)
            .overlay{
                Text("次のゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 9))
                    .onTapGesture {
                        dataManageVM.nextGame()
                        homeVM.scrollToTop = true
                    }
            }
    }
    
    private var nextGameBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(width: 60, height: 20)
            .overlay{
                Text("次のゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 9))
            }
    }
}
