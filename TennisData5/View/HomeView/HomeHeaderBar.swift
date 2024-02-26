
import SwiftUI

struct HomeHeaderBar: View {
    
    @ObservedObject var userVM: UserViewModel
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    
    var body: some View {
        HStack(spacing:0) {
            Image(.logo)
                .resizable()
                .scaledToFill()
                .frame(width: 120,height: 20, alignment: .leading)
            Spacer()
            Image(.angleG)
                .resizable()
                .scaledToFill()
                .frame(width: 15,height: 30)
            Button(action: {
                withAnimation {
                    userVM.showingPopUp = true
                    userVM.levelAndModePopUp = false
                }
            },label:  {
                Text(userVM.myName + " さん")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                    .frame(width: 100, height:30)
                    .background(.gray)
            })
            .clipped()
            Image(.angleGW)
                .resizable()
                .scaledToFill()
                .frame(width: 15,height: 30)
            Button(action: {
                withAnimation {
                    userVM.levelAndModePopUp = true
                    userVM.showingPopUp = false
                }
            },label:  {
                VStack {
                    Text("初心者")
                        .font(.custom("Verdana", size: 8))
                        .foregroundColor(Color.tungsten)
                    Text(matchInfoVM.inputMode.forString)
                        .font(.custom("Verdana", size: 8))
                        .foregroundColor(Color.red)
                        .bold()
                }
                .frame(width: 80, height:30)
                .background(.white)
            })
            .clipped()
        }
        .background(.black)
    }
}
