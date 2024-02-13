import SwiftUI
struct DblsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        VStack(spacing: 1){
            if positionVM.servOrRet == .serviceGame {
                HStack(spacing:1){
                    if positionVM.myPosition == .volleyer && positionVM.side == .duceSide {
                        volleyerServDuceDisBtn
                    } else {
                        volleyerServDuceBtn
                    }
                    if positionVM.myPosition == .volleyer && positionVM.side == .advantageSide {
                        volleyerServAdvDisBtn
                    } else {
                        volleyerServAdvBtn
                    }
                }.padding(.horizontal,10)
                HStack(spacing:1){
                    if positionVM.myPosition == .server && positionVM.side == .advantageSide {
                        serverAdvDisBtn
                    } else {
                        serverAdvBtn
                    }
                    if positionVM.myPosition == .server && positionVM.side == .duceSide {
                        serverDuceDisBtn
                    } else {
                        serverDuceBtn
                    }
                }.padding(.horizontal,10)
            } else if positionVM.servOrRet == .returnGame {
                HStack(spacing:1){
                    if positionVM.myPosition == .volleyer && positionVM.side == .duceSide {
                        volleyerRetDuceDisBtn
                    } else {
                        volleyerRetDuceBtn
                    }
                    if positionVM.myPosition == .volleyer && positionVM.side == .advantageSide {
                        volleyerRetAdvDisBtn
                    } else {
                        volleyerRetAdvBtn
                    }
                }.padding(.horizontal,10)
                HStack(spacing:1){
                    if positionVM.myPosition == .returner && positionVM.side == .advantageSide {
                        returnerAdvDisBtn
                    } else {
                        returnerAdvBtn
                    }
                    if positionVM.myPosition == .returner && positionVM.side == .duceSide {
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
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
    }
    var volleyerServDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurServDuce")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("左の\nボレーヤー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
            
    }
    var volleyerServDuceBtn: some View {
        Button(action: {
            volleyerServDuce()
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("左のボレーヤー")
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurServAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("右のボレーヤー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var volleyerServAdvBtn: some View {
        Button(action: {
            volleyerServAdv()
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurServAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("右のボレーヤー")
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nサーバー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var serverAdvBtn: some View {
        Button(action: {
            serverAdv()
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerDuce")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("フォアサイドの\nサーバー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var serverDuceBtn: some View {
        Button(action: {
            serverDuce()
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurRetDuce")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("左のボレーヤー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var volleyerRetDuceBtn: some View {
        Button(action: {
            volleyerRetDuce()
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurRetDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("左のボレーヤー")
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("VolleyerDurRetAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("右のボレーヤー")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var volleyerRetAdvBtn: some View {
        Button(action: {
            volleyerRetAdv()
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("VolleyerDurRetAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Spacer().frame(width: 5)
                Text("右のボレーヤー")
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerAdv")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("バックサイドの\nリターン")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var returnerAdvBtn: some View {
        Button(action: {
            returnerAdv()
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
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ReturnerDuce")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Spacer().frame(width: 5)
                    Text("フォアサイドの\nリターン")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer()
                }
            )
    }
    var returnerDuceBtn: some View {
        Button(action: {
            returnerDuce()
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
extension DblsPositionBtnArea {
    func volleyerServDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .partner
    }
    func volleyerServAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .partner
    }
    func serverAdv(){
        positionVM.myPosition = .server
        positionVM.side = .advantageSide
        positionVM.server = .mySelf
    }
    func serverDuce(){
        positionVM.myPosition = .server
        positionVM.side = .duceSide
        positionVM.server = .mySelf
    }
    func volleyerRetDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .opponentTeam
    }
    func volleyerRetAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .opponentTeam
    }
    func returnerAdv(){
        positionVM.myPosition = .returner
        positionVM.side = .advantageSide
        positionVM.server = .opponentTeam
    }
    func returnerDuce(){
        positionVM.myPosition = .returner
        positionVM.side = .duceSide
        positionVM.server = .opponentTeam
    }
}


