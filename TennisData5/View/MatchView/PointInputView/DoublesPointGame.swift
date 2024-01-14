import SwiftUI
struct DoublesPointGame: View {
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
                Spacer().frame(height:10)
                MyNameAndScoreArea()
                HStack{
                    Spacer()
                    Text("ビギナーモード")
                        .padding(10)
                        .background(.white)
                        .font(.custom("Verdana",size:10))
                }
                VStack{
                    Spacer().frame(height:10)
                    HStack {
                        Spacer().frame(width: 10)
                        GoBackBtn()
                        Spacer()
                    }
                    Spacer().frame(height: 10)
                    VStack(spacing:1){
                        HStack(spacing:1){
                            Spacer().frame(width: 10)
                            ServiceGame()
                            ReturnGame()
                            Spacer().frame(width: 10)
                        }
                        if pointInputModel.gameSide == .serviceGame {
                            HStack(spacing:1){
                                Spacer().frame(width: 10)
                                VolleyerServDuce()
                                VolleyerServAdv()
                                Spacer().frame(width: 10)
                            }
                            HStack(spacing:1){
                                Spacer().frame(width: 10)
                                ServerAdvDbls()
                                ServerDuceDbls()
                                Spacer().frame(width: 10)
                            }
                        } else if pointInputModel.gameSide == .returnGame {
                            HStack(spacing:1){
                                Spacer().frame(width: 10)
                                VolleyerRetDuce()
                                VolleyerRetAdv()
                                Spacer().frame(width: 10)
                            }
                            HStack(spacing:1){
                                Spacer().frame(width: 10)
                                ReturnerAdvDbls()
                                ReturnerDuceDbls()
                                Spacer().frame(width: 10)
                            }
                        }
                    }
                    Spacer().frame(height: 10)
                    if pointInputModel.position != .NoSelection {
                        VStack{
                            HStack {
                                Spacer().frame(width: 10)
                                if pointInputModel.service == .first {
                                    FaultBtn()
                                } else {
                                    DoubleFaultBtn()
                                }
                                Spacer().frame(width: 10)
                            }
                            Spacer().frame(height: 10)
                            HStack(spacing:1){
                                Spacer().frame(width: 10)
                                VStack(spacing:1){
                                    GetPointBtn()
                                    HStack(spacing:1){
                                        MyWinnerBtn()
                                        PartnerWinnerBtn()
                                    }
                                    OpponentMissBtn()
                                    
                                }
                                VStack(spacing:1){
                                    LostPointBtn()
                                    OpponentWinerBtn()
                                    HStack(spacing:1){
                                        MyMissBtn()
                                        PartnerMissBtn()
                                    }
                                }
                                Spacer().frame(width: 10)
                            }
                            
                        }
                    }
                    Spacer().frame(height: 10)
                    VStack(spacing:1){
                        HStack {
                            Spacer().frame(width: 10)
                            NextGameBtn()
                            Spacer().frame(width: 10)
                        }
                        HStack {
                            Spacer().frame(width: 10)
                            GameEndBtn()
                            Spacer().frame(width: 10)
                        }
                    }
                }
                .background{ Color.white}
                Spacer()
            }
            .background{ Color.mercury }
            .navigationBarTitle("ダブルスポイントゲーム")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
#Preview {
    HomeTabView()
}
