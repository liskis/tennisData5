
import SwiftUI

struct GameProgressArea: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var pointVM: PointViewModel
    @ObservedObject var interstitial: Interstitial
    
    var body: some View {
        HStack(spacing:1) {
            goBackBtn
            if pointVM.allPoint == 0 {
                nextGameBtnDis
            } else {
                nextGameBtn
            }
            if pointVM.allgameCount != 0 && pointVM.allPoint == 0 {
                gameEndBtn
            } else {
                gameEndBtnDis
            }
        }
        .padding(.horizontal,10)
    }
    
    private var goBackBtn: some View {
        Button(action: {
            dataManageVM.goBack()
            Task{
                await dataManageVM.WCGoBack()
            }
        },label: {
            Text("<< 戻る")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background{ Color.ocean }
        })
        .cornerRadius(4)
    }
    
    private var nextGameBtn: some View {
        Button(action: {
            dataManageVM.nextGame()
        },label:{
            Text("次のゲームへ >>")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        })
    }
    
    private var nextGameBtnDis: some View {
        Button(action: {
            
        },label:{
            Text("次のゲームへ >>")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        })
    }
    
    private var gameEndBtn: some View {
        Button(action: {
            dataManageVM.gameEnd()
        }){
            Text("試合を終了する")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        }
    }
    
    private var gameEndBtnDis: some View {
        Button(action: {
            
        }){
            Text("試合を終了する")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.silver}
                .cornerRadius(4)
        }
    }
}
