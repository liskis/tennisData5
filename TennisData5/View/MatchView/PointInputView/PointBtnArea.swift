import SwiftUI
struct PointBtnArea:View {
    var body: some View {
        VStack{
            FaultBtn()
            Spacer().frame(height: 10)
            VStack(spacing:1){
                HStack(spacing:40){
                    GetPointBtn()
                    LostPointBtn()
                }
                HStack(spacing:40){
                    MyTeamWinnerBtn()
                    OpponentWinerBtn()
                }
                HStack(spacing:40){
                    OpponetMissBtn()
                    MyMissBtn()
                }
            }
        }
    }
}

