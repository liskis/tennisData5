
import Foundation
import SwiftUI

struct PointGame: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var pointVM: PointViewModel
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing:0){
                Spacer().frame(height: 20)
                PointGameScoreArea(
                    matchInfoVM: matchInfoVM,
                    pointVM: pointVM,
                    userVM: userVM
                )
                Spacer().frame(height: 10)
                GameProgressArea(
                    dataManageVM: dataManageVM,
                    pointVM: pointVM
                )
                Spacer().frame(height: 10)
                HStack{
                    Spacer()
                    Text("ビギナーモード")
                        .padding(10)
                        .background(.white)
                        .font(.custom("Verdana",size:10))
                }
                InputArea(
                    dataManageVM: dataManageVM,
                    matchInfoVM: matchInfoVM,
                    positionVM: positionVM,
                    pointVM: pointVM
                )
                
                Spacer()
            }
            .background{ Color.mercury }
        .navigationBarTitle(matchInfoVM.naviTitle, displayMode: .inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark)
        }
        .fullScreenCover(isPresented: $homeVM.toOneMatchDataView) {
            OneMatchDataView(
                dataManageVM: dataManageVM,
                homeVM: homeVM,
                pointVM: pointVM,
                matchInfoVM: matchInfoVM,
                chartDataVM: chartDataVM
            )
        }
    }
    
    
}



