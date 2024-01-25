import SwiftUI
struct OneMatchDataView: View {
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = UIScreen.main.bounds.width/2 - 20
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    Spacer(minLength: 20)
                    Text(dateFormatter(date:matchInfoVM.matchStartDate))
                        .font(.custom("Verdana",size:20))
                        .bold()
                        .foregroundColor(.tungsten)
                    Spacer(minLength: 10)
                    NameAndScoreArea(matchInfoVM: matchInfoVM, pointVM:pointVM)
                    Spacer(minLength: 20)
                    ChartsLayOutArea(matchInfoVM: matchInfoVM, chartDataVM: chartDataVM)
                }
                .background{ Color.mercury }
            }
            .navigationBarTitle("マッチデータ", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }   
    }
}
extension OneMatchDataView{
    func dateFormatter(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm"
        return dateFormatter.string(from: date)
    }
}
