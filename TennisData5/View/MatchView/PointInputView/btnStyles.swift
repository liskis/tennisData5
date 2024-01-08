import SwiftUI

struct GoBackBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.brown)
        .cornerRadius(5)
    }
}
struct SinglesSelectPositionBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding(2)
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.green)
        .cornerRadius(5)
    }
}
struct SinglesSelectPositionBtnStyleDisabled: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding(2)
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.gray)
        .cornerRadius(5)
    }
}
struct FaultBtnStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
        .padding()
        .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
        .background(configuration.isPressed ? Color.primary : Color.cyan)
        .cornerRadius(5)
    }
}
struct DoubleFaultBtnStyle: ButtonStyle {
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
          .background(configuration.isPressed ? Color.primary : Color.gray)
          .cornerRadius(5)
    }
}

struct OpponentWinerBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.gray)
          .cornerRadius(5)
    }
}

struct OpponetMissBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.gray)
          .cornerRadius(5)
    }
}

struct MyMissBtnStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
      configuration.label
          .padding()
          .foregroundColor(Color.white).bold().font(.custom("Verdana", size: 14))
          .background(configuration.isPressed ? Color.primary : Color.gray)
          .cornerRadius(5)
    }
}
