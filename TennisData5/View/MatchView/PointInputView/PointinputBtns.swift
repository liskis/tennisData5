import SwiftUI

struct FaultBtn:View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("フォルト")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.horizontal, 10)
        .buttonStyle(FaultBtnStyle())
    }
}
struct FaultBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.purple)
        .cornerRadius(5)
    }
}
struct GetPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとった")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.leading, 10)
        .buttonStyle(GetPointBtnStyle())
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
struct LostPointBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("ポイントをとられた")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.trailing, 10)
        .buttonStyle(LostPointBtnStyle())
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
struct MyTeamWinnerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分たちが決めた")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.leading, 10)
        .buttonStyle(MyWinnerBtnStyle())
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
struct OpponentWinerBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手が決めた")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.trailing, 10)
        .buttonStyle(OpponentWinerBtnStyle())
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
struct OpponetMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("相手のミス")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.leading, 10)
        .buttonStyle(OpponetMissBtnStyle())
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
struct MyMissBtn: View {
    var body: some View {
        Button(action: {
            // action
        }) {
            Text("自分のミス")
            .frame(maxWidth: .infinity, maxHeight: 15)
        }
        .padding(.trailing, 10)
        .buttonStyle(MyMissBtnStyle())
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
