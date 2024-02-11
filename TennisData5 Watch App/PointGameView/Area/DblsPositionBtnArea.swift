import SwiftUI
struct DblsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
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
            }
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
            }
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
            }
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
            }
        } else if positionVM.servOrRet == .noSelection {
            HStack(spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }
            HStack (spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }
        }
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
    }
    var volleyerServDuceDisBtn: some View {
        Text("左ボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var volleyerServDuceBtn: some View {
        Text("左ボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .volleyer
                positionVM.side = .duceSide
                positionVM.server = .partner
            }
    }
    var volleyerServAdvDisBtn: some View {
        Text("右ボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var volleyerServAdvBtn: some View {
        Text("右ボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .volleyer
                positionVM.side = .advantageSide
                positionVM.server = .partner
            }
    }
    var serverAdvDisBtn: some View {
        Text("バックサイド\nサーバー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var serverAdvBtn: some View {
        Text("バックサイド\nサーバー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .server
                positionVM.side = .advantageSide
                positionVM.server = .mySelf
            }
    }
    var serverDuceDisBtn: some View {
        Text("フォアサイド\nサーバー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var serverDuceBtn: some View {
        Text("フォアサイド\nサーバー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .server
                positionVM.side = .duceSide
                positionVM.server = .mySelf
            }
    }
    var volleyerRetDuceDisBtn: some View {
        Text("左の\nボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var volleyerRetDuceBtn: some View {
        Text("左の\nボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .volleyer
                positionVM.side = .duceSide
                positionVM.server = .opponentTeam
            }
    }
    var volleyerRetAdvDisBtn: some View {
        Text("右の\nボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var volleyerRetAdvBtn: some View {
        Text("右の\nボレーヤー")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .volleyer
                positionVM.side = .advantageSide
                positionVM.server = .opponentTeam
            }
    }
    var returnerAdvDisBtn: some View {
        Text("バックサイド\nリターン")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var returnerAdvBtn: some View {
        Text("バックサイド\nリターン")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .returner
                positionVM.side = .advantageSide
                positionVM.server = .opponentTeam
            }
    }
    var returnerDuceDisBtn: some View {
        Text("フォアサイド\nリターン")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var returnerDuceBtn: some View {
        Text("フォアサイド\nリターン")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.fern)
            )
            .onTapGesture {
                positionVM.myPosition = .returner
                positionVM.side = .duceSide
                positionVM.server = .opponentTeam
            }
    }
}
