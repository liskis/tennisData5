import SwiftUI
struct SnglsSelectPositionArea: View {
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                ServerAdvSngls()
                ServerDuceSngls()
            }
            HStack(spacing:1){
                ReturnerAdvSngls()
                ReturnerDuceSngls()
            }
        }
    }
}


#Preview {
    ContentView()
}
