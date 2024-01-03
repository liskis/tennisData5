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
                    MyWinnerBtn()
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

struct FaultBtn:View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("フォルト")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.horizontal, 10)
        .buttonStyle(FaultBtnStyle())
    }
}
struct GetPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとった")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(GetPointBtnStyle())
    }
}
struct LostPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとられた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(LostPointBtnStyle())
    }
}
struct MyWinnerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分が決めた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(MyWinnerBtnStyle())
    }
}
struct OpponentWinerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手が決めた")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(OpponentWinerBtnStyle())
    }
}
struct OpponetMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手のミス")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.leading, 10)
        .buttonStyle(OpponetMissBtnStyle())
    }
}
struct MyMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分のミス")
            .frame(maxWidth: .infinity, minHeight: 30)
        }
        .padding(.trailing, 10)
        .buttonStyle(MyMissBtnStyle())
    }
}
//Style
struct FaultBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.purple)
        .cornerRadius(5)
    }
}
struct GetPointBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.red)
        .cornerRadius(5)
  }
}
struct LostPointBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.blue)
          .cornerRadius(5)
    }
}
struct MyWinnerBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.red)
          .cornerRadius(5)
    }
}
struct OpponentWinerBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.blue)
          .cornerRadius(5)
    }
}
struct OpponetMissBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.red)
          .cornerRadius(5)
    }
}
struct MyMissBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.blue)
          .cornerRadius(5)
    }
}
