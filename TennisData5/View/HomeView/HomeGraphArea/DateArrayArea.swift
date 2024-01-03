import Foundation
import SwiftUI
struct DateArrayArea: View {
    var body: some View {
        HStack{
            ForEach(HomeGraphData.firstServIn){ dataRow in
                Spacer()
                Text("\(dataRow.dateString)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2)
            }
            Spacer()
            
        }
    }
}
#Preview {
    ContentView()
}
