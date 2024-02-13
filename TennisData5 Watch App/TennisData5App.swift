import SwiftUI

@main
struct TennisData5_Watch_AppApp: App {
    @ObservedObject var homeVM = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(homeVM: homeVM)
                .onAppear{
                    homeVM.setLatestMatch()
                }
        }
    }
}
