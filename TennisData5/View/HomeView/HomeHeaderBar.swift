import SwiftUI
struct HomeHeaderBar: View {
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
                     //タップ処理
                },label:  {
                    Text("渡辺健輔さん")
                        .font(.custom("", size: 10))
                })
                .frame(width: 100, height:30)
                .background(.gray)
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
                            .font(.custom("", size: 8))
                            .foregroundColor(Color.black)
                        Text("ビギナーモード")
                            .font(.custom("", size: 8))
                            .foregroundColor(Color.indigo)
                            .bold()
                    }
                })
                .frame(width: 80, height:30)
                .background(.white)
                .clipped()
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}
