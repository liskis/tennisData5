import SwiftUI
struct DblsPositionBtnArea: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        if positionVM.servOrRet == .serviceGame {
            HStack(spacing:1){
                if positionVM.myPosition == .volleyer && positionVM.side == .duceSide {
                    volleyerServDuceDisBtn
                } else {
                    volleyerServDuceBtn
                }
                if positionVM.myPosition == .volleyer && positionVM.side == .advantageSide {
                    volleyerServAdvDisBtn
                } else {
                    volleyerServAdvBtn
                }
            }
            HStack(spacing:1){
                if positionVM.myPosition == .server && positionVM.side == .advantageSide {
                    serverAdvDisBtn
                } else {
                    serverAdvBtn
                }
                if positionVM.myPosition == .server && positionVM.side == .duceSide {
                    serverDuceDisBtn
                } else {
                    serverDuceBtn
                }
            }
        } else if positionVM.servOrRet == .returnGame {
            HStack(spacing:1){
                if positionVM.myPosition == .volleyer && positionVM.side == .duceSide {
                    volleyerRetDuceDisBtn
                } else {
                    volleyerRetDuceBtn
                }
                if positionVM.myPosition == .volleyer && positionVM.side == .advantageSide {
                    volleyerRetAdvDisBtn
                } else {
                    volleyerRetAdvBtn
                }
            }
            HStack(spacing:1){
                if positionVM.myPosition == .returner && positionVM.side == .advantageSide {
                    returnerAdvDisBtn
                } else {
                    returnerAdvBtn
                }
                if positionVM.myPosition == .returner && positionVM.side == .duceSide {
                    returnerDuceDisBtn
                } else {
                    returnerDuceBtn
                }
            }
        } else if positionVM.servOrRet == .noSelection {
            HStack(spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }
            HStack (spacing: 1) {
                posisionDisBtn
                posisionDisBtn
            }
        }
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.gray)
            .frame(height: 30)
    }
    var volleyerServDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("左ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var volleyerServDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("左ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        volleyerServDuce()
                    }
            }
    }
    var volleyerServAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("右ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var volleyerServAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("右ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        volleyerServAdv()
                    }
            }
    }
    var serverAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("バックサイド\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var serverAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("バックサイド\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        serverAdv()
                    }
            }
    }
    var serverDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var serverDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド\nサーバー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        serverDuce()
                    }
            }
    }
    var volleyerRetDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("左ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var volleyerRetDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("左ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        volleyerRetDuce()
                    }
            }
    }
    var volleyerRetAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("右ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var volleyerRetAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("右ボレーヤー")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        volleyerRetAdv()
                    }
            }
    }
    var returnerAdvDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("バックサイド\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var returnerAdvBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("バックサイド\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        returnerAdv()
                    }
            }
    }
    var returnerDuceDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var returnerDuceBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.fern)
            .frame(height: 30)
            .overlay{
                Text("フォアサイド\nリターン")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        returnerDuce()
                    }
            }
    }
}
extension DblsPositionBtnArea {
    func volleyerServDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .partner
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func volleyerServAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .partner
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func serverAdv(){
        positionVM.myPosition = .server
        positionVM.side = .advantageSide
        positionVM.server = .mySelf
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func serverDuce(){
        positionVM.myPosition = .server
        positionVM.side = .duceSide
        positionVM.server = .mySelf
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func volleyerRetDuce(){
        positionVM.myPosition = .volleyer
        positionVM.side = .duceSide
        positionVM.server = .opponentTeam
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func volleyerRetAdv(){
        positionVM.myPosition = .volleyer
        positionVM.side = .advantageSide
        positionVM.server = .opponentTeam
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func returnerAdv(){
        positionVM.myPosition = .returner
        positionVM.side = .advantageSide
        positionVM.server = .opponentTeam
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
    func returnerDuce(){
        positionVM.myPosition = .returner
        positionVM.side = .duceSide
        positionVM.server = .opponentTeam
        Task {
            await dataManageVM.WCSelectPositionAndService()
        }
        WKInterfaceDevice.current().play(.start)
    }
}
