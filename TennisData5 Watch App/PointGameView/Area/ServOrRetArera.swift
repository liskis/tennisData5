
import SwiftUI

struct ServOrRetArea: View {
    @ObservedObject var positionVM: PositionViewModel
    @ObservedObject var pointVM: PointViewModel
    var body: some View {
        HStack(spacing:1){
            if positionVM.servOrRet == .serviceGame {
                serviceGameDisBtn
            } else {
                if pointVM.getPoint + pointVM.lostPoint == 0 {
                    serviceGameBtn
                } else {
                    posisionDisBtn
                }
            }
            if positionVM.servOrRet == .returnGame {
                returnGameDisBtn
            } else {
                if pointVM.getPoint + pointVM.lostPoint == 0 {
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
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("サービスゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var serviceGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.moss)
            .frame(height: 30)
            .overlay{
                Text("サービスゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        positionVM.servOrRet = .serviceGame
                        positionVM.myPosition = .noSelection
                    }
            }
    }
    var returnGameDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 30)
            .overlay{
                Text("リターンゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
            }
    }
    var returnGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.moss)
            .frame(height: 30)
            .overlay{
                Text("リターンゲーム")
                    .foregroundColor(Color.white)
                    .bold()
                    .font(.custom("Verdana", size: 8))
                    .onTapGesture {
                        positionVM.servOrRet = .returnGame
                        positionVM.myPosition = .noSelection
                    }
            }
    }
}
