
import SwiftUI

struct InputArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    
    var body: some View {
        VStack(spacing:1){
            ScrollView {
                VStack(spacing:1){
                    Spacer().frame(height: 10)
                    ServOrRetArea(
                        dataManageVM: dataManageVM,
                        positionVM: positionVM,
                        pointVM: pointVM
                    )
                    if matchInfoVM.matchFormat == .doubles {
                        DblsPositionBtnArea(
                            dataManageVM: dataManageVM,
                            positionVM: positionVM
                        )
                    } else if matchInfoVM.matchFormat == .singles {
                        SnglsPositionBtnArea(
                            dataManageVM: dataManageVM,
                            positionVM: positionVM
                        )
                    }
                    Spacer().frame(height: 10)
                    if positionVM.myPosition == .noSelection {
                        faultBtnDis
                    } else if pointVM.service == .first {
                        faultBtn
                    } else if pointVM.service == .second {
                        doubleFaultBtn
                    }
                    Spacer().frame(height: 10)
                    if matchInfoVM.matchFormat == .singles {
                        SnglsPointBtnArea(
                            dataManageVM: dataManageVM,
                            positionVM: positionVM,
                            pointVM: pointVM
                        )
                    } else if matchInfoVM.matchFormat == .doubles {
                        DblsPointBtnArea(
                            dataManageVM: dataManageVM,
                            positionVM: positionVM,
                            pointVM: pointVM
                        )
                    }
                }
            }
        }
        .background{ Color.white}
    }
    
    private var faultBtnDis: some View {
        Button(action: {
            
        },label:{
            Text("フォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        })
        .padding(.horizontal,10)
        .disabled(true)
    }
    
    private var faultBtn: some View {
        Button(action: {
            dataManageVM.fault()
        },label:{
            Text("フォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.cyan}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
    
    private var doubleFaultBtn: some View {
        Button(action: {
            dataManageVM.doubleFault()
        },label:{
            Text("ダブルフォルト")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.grape}
                .cornerRadius(4)
                .padding(.horizontal,10)
        })
    }
}
