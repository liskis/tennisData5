import SwiftUI

struct RealTimeData: View {
    
    init() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor.black
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    }
    var body: some View {
        NavigationStack{
            VStack{
                Text("helo")
            }
            .background{ Color.mercury }
            .navigationBarTitle("リアルタイムデータ")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


