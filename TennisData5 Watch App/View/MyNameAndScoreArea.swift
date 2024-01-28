import SwiftUI
struct MyNameAndScoreArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        VStack{
            HStack{
                Text(String(pointVM.winCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("勝")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.loseCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("負")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.drowCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("分")
                    .font(.custom("Verdana",size:6))
                    .bold()
            }
            HStack{
                Spacer()
                if matchInfoVM.matchFormat == .singles {
                    Text(matchInfoVM.player1)
                        .font(.custom("Verdana",size:6))
                        .bold()
                } else {
                    Text(matchInfoVM.player1 + "\nチーム")
                        .font(.custom("Verdana",size:6))
                        .bold()
                }
                Spacer()
                VStack{
                    HStack{
                        Text(String(pointVM.myPoint))
                            .font(.custom("Verdana",size:14))
                            .bold()
                        Text("-")
                            .font(.custom("Verdana",size:6))
                            .bold()
                        Text(String(pointVM.opponentPoint))
                            .font(.custom("Verdana",size:14))
                            .bold()
                    }
                }
                Spacer()
                if matchInfoVM.matchFormat == .singles {
                    Text("対戦相手")
                        .font(.custom("Verdana",size:6))
                        .bold()
                } else {
                    Text("相手\nチーム")
                        .font(.custom("Verdana",size:6))
                        .bold()
                }
                Spacer()
            }
        }
    }
}

