
import SwiftUI
import WatchConnectivity
import GoogleMobileAds

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct TennisData5App: App {
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
    }
}
