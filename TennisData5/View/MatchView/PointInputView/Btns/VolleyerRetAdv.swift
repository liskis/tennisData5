import SwiftUI
struct VolleyerRetAdv:View {
    @EnvironmentObject var pointInputModel:PointInputModel
    var body: some View {
        if pointInputModel.position == .VolleyerDurRetAdv {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurRetAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nボレーヤー")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 40)
            .background{Color.asparagus}
            .cornerRadius(4)
            .disabled(true)
        } else {
            Button(action: {
                pointInputModel.position = .VolleyerDurRetAdv
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurRetAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nボレーヤー")
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            })
            .frame(width: .infinity,height: 40)
            .background{Color.fern}
            .cornerRadius(4)
        }
    }
}
