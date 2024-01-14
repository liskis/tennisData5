import Foundation
import SwiftUI
struct SinglesPointGame: View {
    @EnvironmentObject var pointInputModel:PointInputModel
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
        NavigationStack {
            VStack(spacing:0){
                Spacer().frame(height: 20)
                MyNameAndScoreArea()
                HStack{
                    Spacer()
                    Text("ビギナーモード")
                        .padding(10)
                        .background(.white)
                        .font(.custom("Verdana",size:10))
                }
                VStack(spacing:1){
                    Spacer().frame(height:10)
                    HStack {
                        Spacer().frame(width: 10)
                        GoBackBtn()
                        Spacer()
                    }
                    Spacer().frame(height: 10)
                    HStack(spacing:1){
                        Spacer().frame(width: 10)
                        ServerAdvSngls()
                        ServerDuceSngls()
                        Spacer().frame(width: 10)
                    }
                    HStack(spacing:1){
                        Spacer().frame(width: 10)
                        ReturnerAdvSngls()
                        ReturnerDuceSngls()
                        Spacer().frame(width: 10)
                    }
                    Spacer().frame(height: 10)
                    if pointInputModel.position != .NoSelection {
                        HStack(){
                            Spacer().frame(width:10)
                            if pointInputModel.service == .first {
                                FaultBtn()
                            } else {
                                DoubleFaultBtn()
                            }
                            Spacer().frame(width:10)
                        }
                        
                        Spacer().frame(height: 10)
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            GetPointBtn()
                            LostPointBtn()
                            Spacer().frame(width:10)
                        }
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            MyWinnerBtn()
                            OpponentWinerBtn()
                            Spacer().frame(width:10)
                        }
                        HStack(spacing:1){
                            Spacer().frame(width:10)
                            OpponentMissBtn()
                            MyMissBtn()
                            Spacer().frame(width:10)
                        }
                    }
                    Spacer().frame(height: 10)
                    HStack{
                        Spacer().frame(width:10)
                        NextGameBtn()
                        Spacer().frame(width:10)
                    }
                    HStack{
                        Spacer().frame(width:10)
                        GameEndBtn()
                        Spacer().frame(width:10)
                    }
                }
                .background{ Color.white}
                Spacer()
            }
            .background{ Color.mercury }
            .navigationBarTitle("シングルスポイントゲーム")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    HomeTabView()
}
