
import SwiftUI
import Charts

struct RealTimeDataView: View {
    
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Spacer(minLength: 20)
                    PointGameScoreArea(
                        matchInfoVM: matchInfoVM,
                        pointVM:pointVM,
                        userVM: userVM
                    )
                    Spacer(minLength: 20)
                    ChartsLayOutArea(
                        matchInfoVM: matchInfoVM,
                        chartDataVM: chartDataVM
                    )
                }
                .background{ Color.mercury }
            }
            .navigationBarTitle("リアルタイムデータ", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }
    }
}

