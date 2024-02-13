import SwiftUI
struct DblsPointBtnArea: View {
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
        }
    }
    var getPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("ポイントをとった")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var getPointBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.blue)
            .frame(height: 30)
            .overlay{
                Text("ポイントをとった")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        getPoint()
                    }
            }
    }
    var lostPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
            .overlay{
                Text("ポイントをとられた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var lostPointBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.red)
            .frame(height: 30)
            .overlay{
                Text("ポイントをとられた")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        lostPoint()
                    }
            }
    }
}
extension DblsPointBtnArea {
    func getPoint(){
        if positionVM.myPosition != .noSelection {
            pointVM.whichPoint = .myTeam
            pointVM.getPoint += 1
            dataManageVM.pointRecoad()
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
            dataManageVM.pointRecoad()
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
