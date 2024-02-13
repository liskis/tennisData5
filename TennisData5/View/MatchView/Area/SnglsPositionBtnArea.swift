import SwiftUI
struct SnglsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.servOrRet == .serviceGame {
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
            } .padding(.horizontal,10)
        } else if positionVM.servOrRet == .returnGame {
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
            HStack(spacing:1){
                posisionDisBtn
                posisionDisBtn
            }.padding(.horizontal,10)
        }
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
    }
    var serverAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("バックサイド")
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
                Image("ServerAdvSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
            .background{Color.fern}
            .cornerRadius(4)
        })
    }
    var serverDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.asparagus)
            .stroke(.red, lineWidth: 2)
            .overlay(
                HStack(spacing:5){
                    Spacer().frame(width: 5)
                    Image("ServerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("フォアサイド")
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
                Image("ServerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
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
                    Image("ReturnerAdvSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("バックサイド")
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
                Image("ReturnerAdvSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
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
                    Image("ReturnerDuceSngls")
                        .resizable()
                        .frame(width: 40,height: 40)
                    Spacer().frame(width: 5)
                    Text("フォアサイド")
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
                Image("ReturnerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .background{Color.fern}
        .cornerRadius(4)
    }
}
extension SnglsPositionBtnArea {
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
    func returnerAdv(){
        positionVM.myPosition = .returner
        positionVM.side = .advantageSide
        positionVM.server = .opponent
    }
    func returnerDuce(){
        positionVM.myPosition = .returner
        positionVM.side = .duceSide
        positionVM.server = .opponent
    }
}
