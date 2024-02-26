
import SwiftUI

struct SnglsPositionBtnArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
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
    
    private var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 35)
    }
    
    private var serverAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
            }
    }
    
    private var serverAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 35)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
                    .onTapGesture {
                        dataManageVM.serverAdv()
                    }
            }
    }
    
    private var serverDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
            }
    }
    
    private var serverDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 35)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
                    .onTapGesture {
                        dataManageVM.serverDuce()
                    }
            }
    }
    
    private var returnerAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
            }
    }
    
    private var returnerAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 35)
            .overlay{
                Text("バックサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
                    .onTapGesture {
                        dataManageVM.returnerAdv()
                    }
            }
    }
    
    private var returnerDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
            }
    }
    
    private var returnerDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 35)
            .overlay{
                Text("フォアサイド")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 10))
                    .onTapGesture {
                        dataManageVM.returnerDuce()
                    }
            }
    }
}
