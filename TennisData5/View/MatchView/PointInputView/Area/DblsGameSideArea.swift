
import SwiftUI

struct DblsGameSideArea: View {
    @ObservedObject var positionVM: PositionViewModel
    var body: some View {
        HStack(spacing:1){
            if positionVM.gameSide == .serviceGame {
                serviceGameDisBtn
            } else {
                serviceGameBtn
            }
            if positionVM.gameSide == .returnGame {
                returnGameDisBtn
            } else {
                returnGameBtn
            }
        }
        .padding(.horizontal,10)
    }
    var serviceGameDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            Text("サービスゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.asparagus}
                .cornerRadius(4)
        })
        .disabled(true)
    }
    var serviceGameBtn: some View {
        Button(action: {
            positionVM.gameSide = .serviceGame
        },label:{
            Text("サービスゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.fern}
                .cornerRadius(4)
        })
    }
    var returnGameDisBtn: some View {
        Button(action: {
            // NoAction
        },label:{
            Text("リターンゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.asparagus}
                .cornerRadius(4)
        })
        .disabled(true)
    }
    var returnGameBtn: some View {
        Button(action: {
            positionVM.gameSide = .returnGame
        },label:{
            Text("リターンゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.fern}
                .cornerRadius(4)
        })
    }
}

