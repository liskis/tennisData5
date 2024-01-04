import SwiftUI
struct SelectPositionArea: View {
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                ZStack{
                    Button(action: {
                        // action
                    }) {
                        Text("左のサーバー")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    HStack{
                        Spacer()
                        Image("ServerAdv")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35,height: 35)
                            .padding(.trailing,5)
                        
                    }
                }
                ZStack{
                    Button(action: {
                        // action
                    }) {
                        Text("右のサーバー")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    HStack{
                        Image("ServerDuce")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35,height: 35)
                            .padding(.leading,5)
                        Spacer()
                    }
                }
            }
            HStack(spacing:1){
                ZStack{
                    Button(action: {
                        // action
                    }) {
                        Text("左のリターン")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.leading, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    HStack{
                        Spacer()
                        Image("ReturnerAdv")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35,height: 35)
                            .padding(.trailing,5)
                    }
                }
                ZStack{
                    Button(action: {
                        // action
                    }) {
                        Text("右のリターン")
                            .frame(maxWidth: .infinity, maxHeight: 15)
                    }
                    .padding(.trailing, 10)
                    .buttonStyle(SelectPositionBtnStyle())
                    HStack{
                        Image("ReturnerDuce")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35,height: 35)
                            .padding(.leading,5)
                        Spacer()
                    }
                }
            }
        }
    }
}
struct SelectPositionBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.green)
        .cornerRadius(5)
    }
}

#Preview {
    ContentView()
}
