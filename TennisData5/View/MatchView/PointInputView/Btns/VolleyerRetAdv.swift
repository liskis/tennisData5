import SwiftUI
struct VolleyerRetAdv:View {
    @Binding var position: Position
    var body: some View {
        if position == .VolleyerDurRetAdv {
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
            .background{Color.gray}
            .cornerRadius(4)
            .disabled(true)
        } else {
            Button(action: {
                position = .VolleyerDurRetAdv
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
            .background{Color.green}
            .cornerRadius(4)
        }
    }
}
