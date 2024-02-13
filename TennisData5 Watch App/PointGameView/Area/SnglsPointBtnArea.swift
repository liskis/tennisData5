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
extension SnglsPointBtnArea {
    func getPoint(){
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
    func lostPoint(){
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
