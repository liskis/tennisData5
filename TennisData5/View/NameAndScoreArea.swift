
import SwiftUI
struct NameAndScoreArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack{
            Text(String(pointVM.winCount))
                .font(.custom("Verdana",size:40))
                .bold()
            Text("勝")
                .font(.custom("Verdana",size:20))
                .bold()
            Text(String(pointVM.loseCount))
                .font(.custom("Verdana",size:40))
                .bold()
            Text("負")
                .font(.custom("Verdana",size:20))
                .bold()
            Text(String(pointVM.drowCount))
                .font(.custom("Verdana",size:40))
                .bold()
            Text("分")
                .font(.custom("Verdana",size:20))
                .bold()
            if pointVM.winCount > pointVM.loseCount {
                Text("Win")
                    .font(.custom("Verdana",size:30))
                    .bold()
                    .foregroundColor(Color.red)
            } else if pointVM.winCount < pointVM.loseCount {
                Text("Lose")
                    .font(.custom("Verdana",size:30))
                    .bold()
                    .foregroundColor(Color.blue)
            } else {
                Text("Draw")
                    .font(.custom("Verdana",size:30))
                    .bold()
                    .foregroundColor(Color.gray)
            }
        }
    }
}


