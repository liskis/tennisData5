import SwiftUI
struct DataAnalysisView: View {
    var body: some View {
        NavigationStack {
            Text("hello")
            .navigationBarTitle("データ分析", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }
    }
}
