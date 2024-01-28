import SwiftUI
struct DblsPointBtnArea: View {
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack(spacing:1){
            VStack(spacing:1){
                if positionVM.position == .NoSelection {
                    getPointBtnDis
                } else {
                    getPointBtn
                }
            }
            VStack(spacing:1){
                if positionVM.position == .NoSelection {
                    lostPointBtnDis
                } else {
                    lostPointBtn
                }
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
                if positionVM.position != .NoSelection {
                    pointVM.myPoint += 1
                    positionVM.position = .NoSelection
                    pointVM.service = .first
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
                if positionVM.position != .NoSelection {
                    pointVM.opponentPoint += 1
                    positionVM.position = .NoSelection
                    pointVM.service = .first
                }
            }
    
    }
}

