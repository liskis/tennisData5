import Foundation
import SwiftUI
struct DateArrayArea: View {
    @Binding var data1: [LineGraphData]
    var body: some View {
        HStack{
            ForEach(data1){ dataRow in
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
    HomeTabView()
}
