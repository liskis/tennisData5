
import SwiftUI

struct SnglsPointBtnArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    
    var body: some View {
        HStack(spacing:1){
            if positionVM.myPosition == .noSelection {
                getPointBtnDis
                lostPointBtnDis
            } else {
                getPointBtn
                lostPointBtn
            }
        }.padding(.horizontal,10)
        VStack(spacing:1){
            HStack(spacing:1){
                myWinnerBtn
                opponentWinerBtn
            }.padding(.horizontal,10)
            HStack(spacing:1){
                opponentMissBtn
                myMissBtn
            }.padding(.horizontal,10)
        }
    }
    
    private var getPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("ポイントをとった")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    
    private var getPointBtn: some View {
        Button(action: {
            dataManageVM.getPointSngls()
        },label:{
            Text("ポイントをとった")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.blue}
                .cornerRadius(4)
        })
    }
    
    private var lostPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("ポイントをとられた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    
    private var lostPointBtn: some View {
        Button(action: {
            dataManageVM.lostPointSngls()
        },label:{
            Text("ポイントをとられた")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.red}
                .cornerRadius(4)
        })
    }
    
    private var myWinnerBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("自分が決めた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    
    private var opponentMissBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("相手がミス")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    
    private var opponentWinerBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("相手が決めた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    
    private var myMissBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("自分がミス")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
}

