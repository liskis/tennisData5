import SwiftUI
struct MyNameAndScoreArea: View {
    @Binding var winCount: Int
    @Binding var loseCount: Int
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    let ctl = PointGameInputController()
    var body: some View {
        HStack{
            Spacer()
            Text(ctl.userName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
            VStack{
                HStack{
                    Text(String(winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text("-")
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text(String(loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
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
            Text(ctl.opponentName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
}

