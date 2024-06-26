import SwiftUI

struct OneMatchDataScoaArea: View {
    
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    
    var body: some View {
        HStack{
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
            if pointVM.getGameCount > pointVM.lostGameCount {
                Text("Win")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(Color.red)
            } else if pointVM.getGameCount < pointVM.lostGameCount {
                Text("Lose")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(Color.blue)
            } else {
                Text("Draw")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(Color.gray)
            }
        }
    }
}

