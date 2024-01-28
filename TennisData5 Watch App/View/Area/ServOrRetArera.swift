
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
        }
    }
    var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(.gray)
            .frame(height: 30)
    }
    var serviceGameDisBtn: some View {
        Text("サービスゲーム")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var serviceGameBtn: some View {
        Text("サービスゲーム")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.moss)
            )
            .onTapGesture {
                positionVM.servOrRet = .serviceGame
            }
    }
    var returnGameDisBtn: some View {
        Text("リターンゲーム")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.asparagus)
                    .stroke(.white, lineWidth: 2)
            )
    }
    var returnGameBtn: some View {
        Text("リターンゲーム")
            .frame(height: 30)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 8))
            .background(
                RoundedRectangle(cornerRadius: 2)
                    .fill(.moss)
            )
            .onTapGesture {
                positionVM.servOrRet = .returnGame
            }
    }
}

