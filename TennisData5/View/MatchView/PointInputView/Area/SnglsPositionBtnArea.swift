import SwiftUI
struct SnglsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.gameSide == .serviceGame {
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
            } .padding(.horizontal,10)
        } else if positionVM.gameSide == .returnGame {
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
        } else if positionVM.gameSide == .noSelection {
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
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverAdvBtn: some View {
        Button(action: {
            positionVM.position = .ServerAdv
            positionVM.gameSide = .serviceGame
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
            .background{Color.fern}
            .cornerRadius(4)
        })
    }
    var serverDuceDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("サービスゲーム\nフォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
//            .frame(width: .infinity,height: 50)
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var serverDuceBtn: some View {
        Button(action: {
            positionVM.position = .ServerDuce
            positionVM.gameSide = .serviceGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ServerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("サービスゲーム\nフォアサイド")
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
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerAdvSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("リターンゲーム\nバックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
        })
        .background{Color.asparagus}
        .cornerRadius(4)
        .disabled(true)
    }
    var returnerAdvBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerAdv
            positionVM.gameSide = .returnGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerAdvSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("リターンゲーム\nバックサイド")
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
        Button(action: {
            // NoAction
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("リターンゲーム\nフォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
                Spacer()
            }
            .background{Color.asparagus}
            .cornerRadius(4)
        })
        .disabled(true)
    }
    var returnerDuceBtn: some View {
        Button(action: {
            positionVM.position = .ReturnerDuce
            positionVM.gameSide = .returnGame
        },label:{
            HStack(spacing:5){
                Spacer().frame(width: 5)
                Image("ReturnerDuceSngls")
                    .resizable()
                    .frame(width: 40,height: 40)
                Spacer().frame(width: 5)
                Text("リターンゲーム\nフォアサイド")
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

