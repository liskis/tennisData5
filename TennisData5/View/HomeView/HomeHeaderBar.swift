import SwiftUI
struct HomeHeaderBar: View {
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        HStack {
            Image(.logo)
                .resizable()
                .scaledToFill()
                .frame(width: 120,height: 20, alignment: .leading)
            HStack(spacing:0) {
                Image(.angleG)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 15,height: 30)
                Button(action: {
                    withAnimation {
                        userVM.showingPopUp = true
                        userVM.showRealm()
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
                     //タップ処理
                },label:  {
                    VStack {
                        Text("初心者")
                            .font(.custom("Verdana", size: 8))
                            .foregroundColor(Color.tungsten)
                        Text("ビギナーモード")
                            .font(.custom("Verdana", size: 8))
                            .foregroundColor(Color.red)
                            .bold()
                    }
                    .frame(width: 80, height:30)
                    .background(.white)
                })
                .clipped()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
