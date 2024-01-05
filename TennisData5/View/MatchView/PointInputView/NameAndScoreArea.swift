import SwiftUI
struct MyNameAndScoreArea: View {
    let ctl = PointInputController()
    var body: some View {
        HStack{
            Spacer()
            Text(ctl.userName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
            VStack{
                HStack{
                    Text(String(ctl.winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text("-")
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text(String(ctl.loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
                }
                HStack{
                    Text(String(ctl.myPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text("-")
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text(String(ctl.opponentPoint))
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

