
import SwiftUI

struct PointGameScoreArea: View {
    
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        VStack{
            winLoseArea
            pointArea
        }
    }
    
    private var winLoseArea: some View {
        HStack{
            Text(String(pointVM.getGameCount))
                .font(.custom("Verdana",size:20))
                .bold()
            Text("勝")
            Text(String(pointVM.lostGameCount))
                .font(.custom("Verdana",size:20))
                .bold()
            Text("負")
            Text(String(pointVM.drowGameCount))
                .font(.custom("Verdana",size:20))
                .bold()
            Text("分")
        }
    }
    
    private var pointArea: some View {
        HStack{
            Spacer()
            if matchInfoVM.matchFormat == .singles {
                Text(userVM.myName)
                    .font(.custom("Verdana",size:14))
                    .bold()
            } else {
                Text(userVM.myName + "\nチーム")
                    .font(.custom("Verdana",size:14))
                    .bold()
            }
            Spacer()
            Text(String(pointVM.getPoint))
                .font(.custom("Verdana",size:40))
                .bold()
            Text("-")
                .font(.custom("Verdana",size:40))
                .bold()
            Text(String(pointVM.lostPoint))
                .font(.custom("Verdana",size:40))
                .bold()
            Spacer()
            if matchInfoVM.matchFormat == .singles {
                Text("対戦相手")
                    .font(.custom("Verdana",size:14))
                    .bold()
            } else {
                Text("相手\nチーム")
                    .font(.custom("Verdana",size:14))
                    .bold()
            }
            Spacer()
        }
    }
}

