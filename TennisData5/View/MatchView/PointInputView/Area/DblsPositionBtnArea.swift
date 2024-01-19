import SwiftUI
struct DblsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.gameSide == .serviceGame {
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
        } else if positionVM.gameSide == .returnGame {
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
        }
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerServDuceBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurServDuce
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
        .frame(width: .infinity,height: 40)
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerServAdvBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurServAdv
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
        .frame(width: .infinity,height: 40)
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverAdvBtn: some View {
        Button(action: {
            positionVM.position = .ServerAdv
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
        .frame(width: .infinity,height: 40)
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverDuceBtn: some View {
        Button(action: {
            positionVM.position = .ServerDuce
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
        .frame(width: .infinity,height: 40)
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerRetDuceBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurRetDuce
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
        .frame(width: .infinity,height: 40)
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var volleyerRetAdvBtn: some View {
        Button(action: {
            positionVM.position = .VolleyerDurRetAdv
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var returnerAdvBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerAdv
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
        .frame(width: .infinity,height: 40)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var returnerDuceBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerDuce
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
        .frame(width: .infinity,height: 40)
        .background{Color.fern}
        .cornerRadius(4)
    }
}



