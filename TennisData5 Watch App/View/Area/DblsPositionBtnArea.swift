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
            }
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
            }
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
            }
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
        Text("フォアサイド\nボレーヤー")
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
        Text("フォアサイド\nボレーヤー")
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
                positionVM.position = .VolleyerDurServDuce
            }
    }
    var volleyerServAdvDisBtn: some View {
        Text("バックサイド\nボレーヤー")
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
        Text("バックサイド\nボレーヤー")
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
                positionVM.position = .VolleyerDurServAdv
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
                positionVM.position = .ServerAdv
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
                positionVM.position = .ServerDuce
            }
    }
    var volleyerRetDuceDisBtn: some View {
        Text("フォアサイド\nボレーヤー")
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
        Text("フォアサイド\nボレーヤー")
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
                positionVM.position = .VolleyerDurRetDuce
            }
    }
    var volleyerRetAdvDisBtn: some View {
        Text("バックサイド\nボレーヤー")
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
        Text("バックサイド\nボレーヤー")
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
                positionVM.position = .VolleyerDurRetAdv
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
                positionVM.position = .ReturnerAdv
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
                positionVM.position = .ReturnerDuce
            }
    }
}



