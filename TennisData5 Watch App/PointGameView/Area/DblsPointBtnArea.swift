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
        Text("ポイントをとった")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.gray)
            )
    }
    var getPointBtn: some View {
        Text("ポイントをとった")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.red)
            )
            .onTapGesture {
                if positionVM.myPosition != .noSelection {
                    pointVM.whichPoint = .myTeam
                    pointVM.getPoint += 1
                    dataManageVM.pointRecoad()
                    if pointVM.allPoint % 2 == 0 {
                        positionVM.side = .duceSide
                    } else {
                        positionVM.side = .advantageSide
                    }
                    pointVM.service = .first
                    pointVM.whichPoint = .noSelection
                }
            }
    }
    var lostPointBtnDis: some View {
        Text("ポイントをとられた")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.gray)
            )
    }
    var lostPointBtn: some View {
        Text("ポイントをとられた")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.blue)
            )
            .onTapGesture {
                if positionVM.myPosition != .noSelection {
                    pointVM.whichPoint = .opponent
                    pointVM.lostPoint += 1
                    dataManageVM.pointRecoad()
                    if pointVM.allPoint % 2 == 0 {
                        positionVM.side = .duceSide
                    } else {
                        positionVM.side = .advantageSide
                    }
                    pointVM.service = .first
                    pointVM.whichPoint = .noSelection
                }
            }
    }
}
