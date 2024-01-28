
import SwiftUI

struct ServOrRetArea: View {
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack(spacing:1){
            if positionVM.servOrRet == .serviceGame {
                serviceGameDisBtn
            } else {
                if pointVM.myPoint + pointVM.opponentPoint == 0 {
                    serviceGameBtn
                } else {
                    posisionDisBtn
                }
            }
            if positionVM.servOrRet == .returnGame {
                returnGameDisBtn
            } else {
                if pointVM.myPoint + pointVM.opponentPoint == 0 {
                    returnGameBtn
                } else {
                    posisionDisBtn
                }
            }
        } .padding(.horizontal,10)
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .frame(height: 40)
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
            positionVM.servOrRet = .serviceGame
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
            positionVM.servOrRet = .returnGame
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

