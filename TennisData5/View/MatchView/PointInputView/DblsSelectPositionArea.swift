import SwiftUI
struct DblsSelectPositionArea: View {
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                ServerAdv()
                ServerDuce()
            }
            HStack(spacing:1){
                VolleyerDurServDuce()
                VolleyerDurServAdv()
            }
            HStack(spacing:1){
                VolleyerDurRetDuce()
                VolleyerDurRetAdv()
            }
            HStack(spacing:1){
                ReturnerAdv()
                ReturnerDuce()
            }
        }
    }
}
