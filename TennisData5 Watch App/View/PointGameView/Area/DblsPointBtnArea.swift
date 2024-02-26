
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
    
    private var getPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("ポイントを")
                    Text("とった")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
            }
    }
    
    private var getPointBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.blue)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("ポイントを")
                    Text("とった")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
                .onTapGesture {
                    dataManageVM.getPointDbls()
                }
            }
    }
    
    private var lostPointBtnDis: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("ポイントを")
                    Text("とられた")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
            }
    }
    
    private var lostPointBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.red)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("ポイントを")
                    Text("とられた")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
                .onTapGesture {
                    dataManageVM.lostPointDbls()
                }
            }
    }
}
