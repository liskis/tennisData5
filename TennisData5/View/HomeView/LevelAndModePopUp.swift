
import SwiftUI

struct LevelAndModePopUp: View {
    
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    
    var body: some View {
        VStack{
            ZStack{
                VStack(){
                    advice
                    Spacer().frame(height: 20)
                    promotion
                    Spacer().frame(height: 10)
                    conditions
                    Spacer().frame(height: 20)
                    selectMode
                }
                Text("Please wait for update !")
                    .frame(width: 180,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-10))
            }
            Spacer().frame(height: 20)
            closeBtn
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private var advice: some View {
        VStack(spacing: 6) {
            Text("　まずは試合をしながらポイントを入力することに慣れていきましょう。")
                .foregroundColor(Color.gray)
                .font(.custom("Verdana", size: 14))
            Text("　戻るをタップすれば入力したボタンをキャンセルできますが、最初のうちは間違えることも多いはず。")
                .foregroundColor(Color.gray)
                .font(.custom("Verdana", size: 14))
            Text("　多少のミスは気にせず、どんどん入力してみてください。「習うより慣れろ」です！")
                .foregroundColor(Color.gray)
                .font(.custom("Verdana", size: 14))
        }
        .padding(.horizontal,20)
    }
    
    private var promotion: some View {
        Text("初心者から初級への進級条件：")
            .foregroundColor(Color.gray)
            .bold()
            .font(.custom("Verdana", size: 12))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var conditions: some View {
        Text("ポイントゲームで１００ポイント以上を達成")
            .foregroundColor(Color.gray)
            .bold()
            .font(.custom("Verdana", size: 12))
    }
    
    private var selectMode: some View {
        Form{
            Picker("inputMode", selection: $matchInfoVM.inputMode){
                ForEach(InputMode.allCases, id: \.self) { format in
                    Text(format.forString)
                        .foregroundColor(Color.tungsten)
                        .font(.custom("Verdana", size: 10))
                }
            }
            .pickerStyle(.inline)
            .cornerRadius(10)
            .padding(.horizontal,10)
            .disabled(true)
            .frame(height: 12)
        }
        .frame(height: 220)
    }
    
    private var closeBtn: some View {
        Button(action: {
            withAnimation {
                userVM.levelAndModePopUp = false
            }
        }, label: {
            Text("閉じる")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        })
    }
}
