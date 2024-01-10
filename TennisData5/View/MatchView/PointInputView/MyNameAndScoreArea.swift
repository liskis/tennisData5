import SwiftUI
struct MyNameAndScoreArea: View {
    @Binding var winCount: Int
    @Binding var loseCount: Int
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
<<<<<<< HEAD
    let ctl = PointGameInputController()
=======
    let ctl = SnglsPintGmPointInputController()
>>>>>>> 7f5c7b92233c277265fb174476d2cdc074b1198d
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

