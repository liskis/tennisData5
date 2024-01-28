import SwiftUI
struct SnglsPositionBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.servOrRet == .serviceGame {
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
            HStack(spacing:1){
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
    var serverAdvDisBtn: some View {
        Text("バックサイド")
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
        Text("バックサイド")
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
        Text("フォアサイド")
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
        Text("フォアサイド")
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
    var returnerAdvDisBtn: some View {
        Text("バックサイド")
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
        Text("バックサイド")
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
        Text("フォアサイド")
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
        Text("フォアサイド")
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

