import SwiftUI
import Charts
struct RealTimeDataView: View {
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Spacer(minLength: 20)
                    MyNameAndScoreArea(matchInfoVM: matchInfoVM, pointVM:pointVM)
                    Spacer(minLength: 20)
                    ChartsLayOutArea(matchInfoVM: matchInfoVM, chartDataVM: chartDataVM)
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

