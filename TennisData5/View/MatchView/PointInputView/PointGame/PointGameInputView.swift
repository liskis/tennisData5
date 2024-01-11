import Foundation
import SwiftUI
struct PointGameInputView: View {
    let ctl = PointGameInputController()
    @Binding var matchFormat: MatchFormat
    init(matchFormat: Binding<MatchFormat>) {
        self._matchFormat = matchFormat
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        NavigationStack {
            ZStack{
                Color.gray.ignoresSafeArea()
                if matchFormat == .singles {
                    SinglesPointGame(matchFormat: $matchFormat)
                }
            }
            .navigationBarTitle(
                ctl.naviTitle(matchFormat: matchFormat),
                displayMode: .inline
            )
        }
    } // body
} // PointInputView



    



#Preview {
    HomeTabView()
}


