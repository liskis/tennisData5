
import SwiftUI

struct ServOrRetArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
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
    
    private var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 1)
            .fill(.gray)
            .frame(height: 30)
    }
    
    private var serviceGameDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("サービス")
                    Text("ゲーム")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
            }
    }
    
    private var serviceGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.moss)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("サービス")
                    Text("ゲーム")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
                .onTapGesture {
                    dataManageVM.serviceGame()
                }
            }
    }
    
    private var returnGameDisBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.asparagus)
            .stroke(.white, lineWidth: 2)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("リターン")
                    Text("ゲーム")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
            }
    }
    
    private var returnGameBtn: some View {
        RoundedRectangle(cornerRadius: 2)
            .fill(.moss)
            .frame(height: 35)
            .overlay{
                VStack {
                    Text("リターン")
                    Text("ゲーム")
                }
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 10))
                .onTapGesture {
                    dataManageVM.returnGame()
                }
            }
    }
}
