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
            }
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
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var serverAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        serverAdv()
                    }
            }
    }
    var serverDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var serverDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        serverDuce()
                    }
            }
    }
    var returnerAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var returnerAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        returnerAdv()
                    }
            }
    }
    var returnerDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var returnerDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        returnerDuce()
                    }
            }
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
