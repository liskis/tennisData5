import SwiftUI
struct NameAndScoreArea: View {

    var body: some View {
        HStack{
            Spacer()
            Text(PointInputController.userName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
            VStack{
                HStack{
                    Text(String(PointInputController.winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text("-")
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text(String(PointInputController.loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
                }
                HStack{
                    Text(String(PointInputController.myPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text("-")
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text(String(PointInputController.opponentPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                }
            }
            Spacer()
            Text(PointInputController.opponentName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
}

