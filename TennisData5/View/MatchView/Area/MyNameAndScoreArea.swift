import SwiftUI
struct MyNameAndScoreArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        VStack{
            HStack{
                Text(String(pointVM.winCount))
                    .font(.custom("Verdana",size:20))
                    .bold()
                Text("勝")
                Text(String(pointVM.loseCount))
                    .font(.custom("Verdana",size:20))
                    .bold()
                Text("負")
                Text(String(pointVM.drowCount))
                    .font(.custom("Verdana",size:20))
                    .bold()
                Text("分")
            }
        }
        HStack{
            Spacer()
            if matchInfoVM.matchFormat == .singles {
                Text(userVM.myName)
                    .font(.custom("Verdana",size:14))
                    .bold()
            } else {
                Text(userVM.myName + "チーム")
                    .font(.custom("Verdana",size:14))
                    .bold()
            }
            Spacer()
            
                
            HStack{
                Text(String(pointVM.myPoint))
                    .font(.custom("Verdana",size:40))
                    .bold()
                Text("-")
                    .font(.custom("Verdana",size:40))
                    .bold()
                Text(String(pointVM.opponentPoint))
                    .font(.custom("Verdana",size:40))
                    .bold()
            }
            
            Spacer()
            if matchInfoVM.matchFormat == .singles {
                Text("対戦相手")
                    .font(.custom("Verdana",size:14))
                    .bold()
            } else {
                Text("相手チーム")
                    .font(.custom("Verdana",size:14))
                    .bold()
            }
            Spacer()
        }
    }
}

