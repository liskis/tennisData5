import SwiftUI

struct LevelAndModePopUp: View {
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        VStack{
            ZStack{
                VStack(spacing:8){
                    Text("初心者から初級への進級条件：")
                        .foregroundColor(Color.tungsten)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Text("ポイントゲームで１００ポイント以上を達成")
                        .foregroundColor(Color.red)
                        .bold()
                        .font(.custom("Verdana", size: 12))
                    Spacer().frame(height: 16)
                    Picker("inputMode", selection: $userVM.inputMode){
                        ForEach(InputMode.allCases, id: \.self) { format in
                            Text(format.forString)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    .disabled(true)
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
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}
