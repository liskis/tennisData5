import SwiftUI
struct ReturnerAdvDbls:View {
    @Binding var position: Position
    var body: some View {
        if position == .ReturnerAdv {
            Button(action: {
                // NoAction
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nリターン")
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
                position = .ReturnerAdv
            },label:{
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nリターン")
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
