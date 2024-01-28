import Foundation
class HomeChartViewModel: ObservableObject {
    @Published var data1: [LineChartDataModel] = [
        .init(dateString: "23/12/1", stats: 60, category: "data1", issue: .Win),
        .init(dateString: "23/12/8", stats: 63, category: "data1", issue: .Win),
        .init(dateString: "23/12/15", stats: 70, category: "data1", issue: .Lose),
        .init(dateString: "23/12/16", stats: 70, category: "data1", issue: .Lose),
        .init(dateString: "23/12/22", stats: 70, category: "data1", issue: .Win)
    ]
    @Published var data2: [LineChartDataModel] = [
        .init(dateString: "23/12/1", stats: 90, category: "data2", issue: .Win),
        .init(dateString: "23/12/8", stats: 96, category: "data2", issue: .Win),
        .init(dateString: "23/12/15", stats: 89, category: "data2", issue: .Lose),
        .init(dateString: "23/12/16", stats: 96, category: "data2", issue: .Lose),
        .init(dateString: "23/12/22", stats: 96, category: "data2", issue: .Win)
    ]
}
