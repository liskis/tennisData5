import SwiftUI
struct MatchView: View {
    @Binding var gameType: String
    init(gameType: Binding<String>) {
        self._gameType = gameType
        let contentViewAp: UITabBarAppearance = UITabBarAppearance()
        contentViewAp.backgroundColor = .black
        UITabBar.appearance().scrollEdgeAppearance = contentViewAp
        UITabBar.appearance().standardAppearance = contentViewAp
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }

    var body: some View {
            TabView {
                PointInputView(gameType:$gameType).tabItem {
                    Text("ポイント入力")
                    Image(systemName: "hand.point.up")
                }
                RealTimeDataView().tabItem {
                    Text("リアルタイムデータ")
                    Image(systemName: "gauge.with.dots.needle.67percent")
                }
            }
            .accentColor(.white)
    }
}
//class Person: ObservableObject {
//    @Published var firstName: String = ""
//    @Published var lastName: String = ""
//
//    var name : String {
//        get {
//            firstName + " " + lastName
//        }
//    }
//}
//struct PersonView: View {
//    @EnvironmentObject private var person: Person
//    
//    var body: some View {
//        VStack {
//            Text(person.name)
//        }
//    }
//}
//struct parentView: View {
//    @ObservedObject var person = Person()
//    person.firstName = "渡辺"
//
//    var body: some View {
//        PersonView().environmentObject(person)
//    }
//}

#Preview {
    ContentView()
}
