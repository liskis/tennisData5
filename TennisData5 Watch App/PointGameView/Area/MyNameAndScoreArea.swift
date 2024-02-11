import SwiftUI
struct MyNameAndScoreArea: View {
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        VStack(spacing:1){
            HStack{
                Text(String(pointVM.getGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("勝")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.lostGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("負")
                    .font(.custom("Verdana",size:6))
                    .bold()
                Text(String(pointVM.drowGameCount))
                    .font(.custom("Verdana",size:10))
                    .bold()
                Text("分")
                    .font(.custom("Verdana",size:6))
                    .bold()
            }
            HStack{
                Spacer()
                if matchInfoVM.matchFormat == .singles {
                    Text(userVM.myName)
                        .font(.custom("Verdana",size:6))
                        .bold()
                } else {
                    Text(userVM.myName + "\nチーム")
                        .font(.custom("Verdana",size:6))
                        .bold()
                }
                Spacer()
                VStack{
                    HStack{
                        Text(String(pointVM.getPoint))
                            .font(.custom("Verdana",size:14))
                            .bold()
                        Text("-")
                            .font(.custom("Verdana",size:6))
                            .bold()
                        Text(String(pointVM.lostPoint))
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
        .frame(height: 28)
    }
}
