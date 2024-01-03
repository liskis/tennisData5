import SwiftUI
struct NameAndScoreArea: View {
    let pointInputController = PointInputController()
    var body: some View {
        HStack{
            Spacer()
            Text(pointInputController.userName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
            VStack{
                HStack{
                    Text(String(pointInputController.winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text("-")
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text(String(pointInputController.loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
                }
                HStack{
                    Text(String(pointInputController.myPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text("-")
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text(String(pointInputController.opponentPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                }
            }
            Spacer()
            Text(pointInputController.opponentName)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
}

