
import SwiftUI

struct MatchTabView: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var homeVM: HomeViewModel
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var interstitial: Interstitial
    
    var body: some View {
        TabView {
            pointGame
            realTimeDataView
        }
        .accentColor(.white)
    }
    
    private var pointGame: some View {
        PointGame(
            dataManageVM: dataManageVM,
            matchInfoVM: matchInfoVM,
            homeVM: homeVM,
            userVM: userVM,
            positionVM: dataManageVM.positionVM,
            chartDataVM: dataManageVM.chartDataVM,
            pointVM: dataManageVM.pointVM,
            interstitial: interstitial
        )
        .toolbarBackground(.black, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .tabItem {
            Label("ポイント入力", systemImage: "hand.point.up")
        }
    }
    
    private var realTimeDataView: some View {
        RealTimeDataView(
            pointVM: dataManageVM.pointVM,
            matchInfoVM: matchInfoVM,
            chartDataVM: dataManageVM.chartDataVM,
            userVM: userVM
        )
        .toolbarBackground(.black, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .tabItem {
            Label("リアルタイムデータ", systemImage: "chart.bar.doc.horizontal")
        }
        .tabViewStyle(.automatic)
    }
}

