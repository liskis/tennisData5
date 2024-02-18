import SwiftUI
struct DblsPointBtnArea: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack(spacing:1){
            VStack(spacing:1){
                if positionVM.myPosition == .noSelection {
                    getPointBtnDis
                } else {
                    getPointBtn
                }
                VStack(spacing:1){
                    HStack(spacing:1){
                        myWinnerBtn
                        partnerWinnerBtn
                    }
                    opponentMissBtn
                }
            }.padding(.leading,10)
            VStack(spacing:1){
                if positionVM.myPosition == .noSelection {
                    lostPointBtnDis
                } else {
                    lostPointBtn
                }
                VStack(spacing:1){
                    opponentWinerBtn
                    HStack(spacing:1){
                        myMissBtn
                        partnerMissBtn
                    }
                }
            }.padding(.trailing,10)
        }
    }
    var getPointBtnDis: some View {
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
    var getPointBtn: some View {
        Button(action: {
            getPoint()
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
    var lostPointBtnDis: some View {
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
    var lostPointBtn: some View {
        Button(action: {
            lostPoint()
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
    var myWinnerBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("自分が決めた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )    }
    var partnerWinnerBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("味方が決めた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
    var opponentMissBtn: some View {
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
    var opponentWinerBtn: some View {
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
    var myMissBtn: some View {
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
    var partnerMissBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
            .overlay(
                Text("味方がミス")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 12))
            )
    }
}
extension DblsPointBtnArea {
    func getPoint(){
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
            let pointData = dataManageVM.pointRecoad()
            Task {
                await dataManageVM.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            if positionVM.servOrRet == .returnGame {
                if positionVM.myPosition == .volleyer {
                    positionVM.myPosition = .returner
                } else {
                    positionVM.myPosition = .volleyer
                }
            }
            pointVM.service = .first
        }
    }
    func lostPoint(){
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .opponent
            pointVM.lostPoint += 1
            let pointData = dataManageVM.pointRecoad()
            Task {
                await dataManageVM.WCGetAndLostPoint(pointData:pointData)
            }
            if positionVM.side == .advantageSide {
                positionVM.side = .duceSide
            } else if positionVM.side == .duceSide {
                positionVM.side = .advantageSide
            }
            if positionVM.servOrRet == .returnGame {
                if positionVM.myPosition == .volleyer {
                    positionVM.myPosition = .returner
                } else {
                    positionVM.myPosition = .volleyer
                }
            }
            pointVM.service = .first
        }
    }
}
