import SwiftUI
struct ServerAdvSngls: View {
    var ctl = SnglsPintGmPointInputController()
    @State var position: Position = .NoSelection
    var body: some View {
        if position == .ServerAdv {
            Button(action: {
                // action
            }) {
                HStack(spacing:0){
                    Spacer()
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Text("左のサーバー")
                        .frame(maxWidth: .infinity, maxHeight: 15)
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
            .disabled(true)
        } else {
            Button(action: {
                self.position = .ServerAdv
            }) {
                HStack(spacing:0){
                    Spacer()
                    Image("ServerAdvSngls")
                        .resizable()
                        .frame(width: 35,height: 35)
                    Text("左のサーバー")
                        .frame(maxWidth: .infinity, maxHeight: 15)
                    Spacer()
                }
            }
            .padding(.leading, 10)
            .buttonStyle(SinglesSelectPositionBtnStyle())
        }
    }
}
struct ServerDuceSngls:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ServerDuceSngls")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("右のサーバー")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct ReturnerAdvSngls: View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ReturnerAdvSngls")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("左のリターン")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.leading, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct ReturnerDuceSngls:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ReturnerDuceSngls")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("右のリターン")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct ServerAdv: View { //ダブルス
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ServerAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("左のサーバー")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.leading, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}

struct ServerDuce:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ServerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("右のサーバー")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct VolleyerDurServDuce:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("VolleyerDurServDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                VStack(spacing:10){
                    Text("サービスゲームの")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                    Text("左ボレーヤー")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                }
                Spacer()
            }
        }
        .padding(.leading, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct VolleyerDurServAdv:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("VolleyerDurServAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                VStack(spacing:10){
                    Text("サービスゲームの")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                    Text("右ボレーヤー")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                }
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct VolleyerDurRetDuce:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("VolleyerDurRetDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                VStack(spacing:10){
                    Text("リターンゲームの")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                    Text("左ボレーヤー")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                }
                Spacer()
            }
        }
        .padding(.leading, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct VolleyerDurRetAdv:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("VolleyerDurRetAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                VStack(spacing:10){
                    Text("リターンゲームの")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                    Text("右ボレーヤー")
                        .frame(maxWidth: .infinity, maxHeight: 5)
                }
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}
struct ReturnerAdv: View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ReturnerAdv")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("左のリターン")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.leading, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}

struct ReturnerDuce:View {
    var body: some View {
        Button(action: {
                // action
        }) {
            HStack(spacing:0){
                Spacer()
                Image("ReturnerDuce")
                    .resizable()
                    .frame(width: 35,height: 35)
                Text("右のリターン")
                    .frame(maxWidth: .infinity, maxHeight: 15)
                Spacer()
            }
        }
        .padding(.trailing, 10)
        .buttonStyle(SelectPositionBtnStyle())
    }
}

struct SelectPositionBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding(2)
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.green)
        .cornerRadius(5)
    }
}

#Preview {
    HomeTabView()
}
