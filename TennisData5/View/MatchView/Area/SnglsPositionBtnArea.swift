
import SwiftUI

struct SnglsPositionBtnArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var positionVM: PositionViewModel
    
    var body: some View {
        
        if positionVM.servOrRet == .serviceGame {
            
            serviceGamePositionBtn
        } else if positionVM.servOrRet == .returnGame {
            
            returnGamePositionBtn
        } else if positionVM.servOrRet == .noSelection {
            
            HStack(spacing:1){
                posisionDisBtn
                posisionDisBtn
            }.padding(.horizontal,10)
        }
    }
    
    private var serviceGamePositionBtn: some View {
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
    }
    
    private var returnGamePositionBtn: some View {
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
    }
    
    private var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
    }
    
    private var serverAdvDisBtn: some View {
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
    
    private var serverAdvBtn: some View {
        Button(action: {
            dataManageVM.serverAdv()
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
    
    private var serverDuceDisBtn: some View {
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
    
    private var serverDuceBtn: some View {
        Button(action: {
            dataManageVM.serverDuce()
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
    
    private var returnerAdvDisBtn: some View {
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
    
    private var returnerAdvBtn: some View {
        Button(action: {
            dataManageVM.returnerAdv()
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
    
    private var returnerDuceDisBtn: some View {
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
    
    private var returnerDuceBtn: some View {
        Button(action: {
            dataManageVM.returnerDuce()
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
