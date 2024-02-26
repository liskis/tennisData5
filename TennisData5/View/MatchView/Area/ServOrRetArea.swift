
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
        } .padding(.horizontal,10)
    }
    
    private var posisionDisBtn: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(.silver)
            .stroke(.silver, lineWidth: 2)
            .frame(height: 40)
            
    }
    
    private var serviceGameDisBtn: some View {
        Text("サービスゲーム")
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 12))
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.asparagus)
                    .stroke(.red, lineWidth: 2)
            )
    }
    
    private var serviceGameBtn: some View {
        Button(action: {
            dataManageVM.serviceGame()
        },label:{
            Text("サービスゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
        })
        .background{Color.fern}
        .cornerRadius(4)
    }
    
    private var returnGameDisBtn: some View {
        Text("リターンゲーム")
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .foregroundColor(Color.white)
            .bold()
            .font(.custom("Verdana", size: 12))
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(.asparagus)
                    .stroke(.red, lineWidth: 2)
            )
    }
    
    private var returnGameBtn: some View {
        Button(action: {
            dataManageVM.returnGame()
        },label:{
            Text("リターンゲーム")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                
        })
        .background{Color.fern}
        .cornerRadius(4)
    }
}
