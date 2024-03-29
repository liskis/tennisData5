
import SwiftUI
import WatchConnectivity
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct TennisData5App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeTabView()
        }
    }
}
