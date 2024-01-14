import SwiftUI
struct MyNameAndScoreArea: View {
    @EnvironmentObject var pointInputModel:PointInputModel
    let pointInputData = PointInputData()
    var body: some View {
        HStack{
            Spacer()
            if pointInputModel.matchFormat == .singles {
                Text(pointInputData.userName)
                    .font(.custom("Verdana",size:14))
                    .bold()
            } else {
                Text(pointInputData.userName + "チーム")
                    .font(.custom("Verdana",size:14))
                    .bold()
            }
            
            Spacer()
            VStack{
                HStack{
                    Text(String(pointInputModel.winCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("勝")
                    Text(String(pointInputModel.loseCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("負")
                    Text(String(pointInputModel.drowCount))
                        .font(.custom("Verdana",size:20))
                        .bold()
                    Text("分")
                }
                HStack{
                    Text(String(pointInputModel.myPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text("-")
                        .font(.custom("Verdana",size:40))
                        .bold()
                    Text(String(pointInputModel.opponentPoint))
                        .font(.custom("Verdana",size:40))
                        .bold()
                }
            }
            Spacer()
            if pointInputModel.matchFormat == .singles {
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

