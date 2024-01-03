import Foundation
import SwiftUI
struct DateArrayArea: View {
    let homeCtl = HomeController()
    var body: some View {
        HStack{
            ForEach(homeCtl.firstServIn){ dataRow in
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
