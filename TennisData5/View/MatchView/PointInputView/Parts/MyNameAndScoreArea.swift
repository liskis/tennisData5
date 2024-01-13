import SwiftUI
struct MyNameAndScoreArea: View {
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    @Binding var winCount: Int
    @Binding var loseCount: Int
    @Binding var drowCount: Int
    let pointInputData = PointInputData()
    var body: some View {
        HStack{
            Spacer()
            Text(pointInputData.userName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
            VStack{
                HStack{
                    Text(String(winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text(String(loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
                    Text(String(drowCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("分")
                }
                HStack{
                    Text(String(myPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text("-")
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text(String(opponentPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                }
            }
            Spacer()
            Text("対戦相手")
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
}

