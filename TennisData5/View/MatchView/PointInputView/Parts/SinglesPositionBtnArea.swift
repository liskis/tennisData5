
import SwiftUI
struct SinglesPositionBtnArea: View {
    @Binding var myPoint: Int
    @Binding var opponentPoint: Int
    @Binding var position: Position
    let pointInputData = PointInputData()
    var body: some View {
        VStack(spacing:1){
            HStack(spacing:1){
                if position == .ServerAdv {
                    Button(action: {
                        // NoAction
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
                        position = .ServerAdv
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
                if position == .ServerDuce {
                    Button(action: {
                        // NoAction
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
                    .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                    .disabled(true)
                } else {
                    Button(action: {
                        position = .ServerDuce
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
                    .buttonStyle(SinglesSelectPositionBtnStyle())
                }
            }
            HStack(spacing:1){
                if position == .ReturnerAdv {
                    Button(action: {
                        // NoAction
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
                    .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                    .disabled(true)
                } else {
                    Button(action: {
                        position = .ReturnerAdv
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
                    .buttonStyle(SinglesSelectPositionBtnStyle())
                }
                if position == .ReturnerDuce {
                    Button(action: {
                        // NoAction
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
                    .buttonStyle(SinglesSelectPositionBtnStyleDisabled())
                    .disabled(true)
                } else {
                    Button(action: {
                        position = .ReturnerDuce
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
                    .buttonStyle(SinglesSelectPositionBtnStyle())
                }
            }
        }
    }
}

//#Preview {
//    SinglesPositionBtnArea()
//}
