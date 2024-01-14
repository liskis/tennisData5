import SwiftUI
struct ServerAdvSngls:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        if pointInputModel.position == .ServerAdv {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nバックサイド")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 50)
            .background{Color.asparagus}
            .cornerRadius(4)
            .disabled(true)
        } else {
            Button(action: {
                pointInputModel.position = .ServerAdv
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("サービスゲーム\nバックサイド")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 50)
            .background{Color.fern}
            .cornerRadius(4)
        }
    }
}
