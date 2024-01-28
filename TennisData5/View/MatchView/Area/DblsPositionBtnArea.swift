import SwiftUI
struct DblsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.servOrRet == .serviceGame {
            HStack(spacing:1){
                if positionVM.position == .VolleyerDurServDuce {
                    volleyerServDuceDisBtn
                } else {
                    volleyerServDuceBtn
                }
                if positionVM.position == .VolleyerDurServAdv {
                    volleyerServAdvDisBtn
                } else {
                    volleyerServAdvBtn
                }
            }.padding(.horizontal,10)
            HStack(spacing:1){
                if positionVM.position == .ServerAdv {
                    serverAdvDisBtn
                } else {
                    serverAdvBtn
                }
                if positionVM.position == .ServerDuce {
                    serverDuceDisBtn
                } else {
                    serverDuceBtn
                }
            }.padding(.horizontal,10)
        } else if positionVM.servOrRet == .returnGame {
            HStack(spacing:1){
                if positionVM.position == .VolleyerDurRetDuce {
                    volleyerRetDuceDisBtn
                } else {
                    volleyerRetDuceBtn
                }
                if positionVM.position == .VolleyerDurRetAdv {
                    volleyerRetAdvDisBtn
                } else {
                    volleyerRetAdvBtn
                }
            }.padding(.horizontal,10)
            HStack(spacing:1){
                if positionVM.position == .ReturnerAdv {
                    returnerAdvDisBtn
                } else {
                    returnerAdvBtn
                }
                if positionVM.position == .ReturnerDuce {
                    returnerDuceDisBtn
                } else {
                    returnerDuceBtn
                }
            }.padding(.horizontal,10)
        } else if positionVM.servOrRet == .noSelection {
            HStack(spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }.padding(.horizontal,10)
            HStack (spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }.padding(.horizontal, 10)
        }
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
    }
    var volleyerServDuceDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerServDuceBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurServDuce
            positionVM.servOrRet = .serviceGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var volleyerServAdvDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServAdv")
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
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerServAdvBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurServAdv
            positionVM.servOrRet = .serviceGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServAdv")
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
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var serverAdvDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("バックサイドの\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverAdvBtn: some View {
        Button(action: {
            positionVM.position = .ServerAdv
            positionVM.servOrRet = .serviceGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("バックサイドの\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var serverDuceDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverDuceBtn: some View {
        Button(action: {
            positionVM.position = .ServerDuce
            positionVM.servOrRet = .serviceGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var volleyerRetDuceDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurRetDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerRetDuceBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurRetDuce
            positionVM.servOrRet = .returnGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurRetDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var volleyerRetAdvDisBtn: some View {
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
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerRetAdvBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurRetAdv
            positionVM.servOrRet = .returnGame
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
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var returnerAdvDisBtn: some View {
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
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var returnerAdvBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerAdv
            positionVM.servOrRet = .returnGame
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
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
    var returnerDuceDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var returnerDuceBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerDuce
            positionVM.servOrRet = .returnGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("フォアサイドの\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .frame(height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
}



