import SwiftUI
import Charts
@available(iOS 17.0, *)
struct PieChartView: View {
    @Binding var pieChartData: [PieChartDataModel]
    let width = (UIScreen.main.bounds.width)/2 - 20
    var body: some View {
        ZStack{
            Chart(pieChartData) { dataRow in
                SectorMark(
                    angle: .value("count", dataRow.value),
                    angularInset: 1
                )
                .foregroundStyle(by: .value("name", dataRow.name))
                .cornerRadius(4)
            }
            .rotationEffect(.degrees(270))
            .chartLegend(.hidden)
            .chartForegroundStyleScale([
                "getPoint": .red, "lostPoint": .blue, "blank": .white
            ])
            .frame(width: width)

            HStack{
                ForEach(pieChartData) { datum in
                    if datum.nameString != "" {
                        VStack{
                            Spacer().frame(height: width/2)
                            Text(datum.nameString)
                                .font(.custom("Verdana",size:10))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 3)
                            Text(String(datum.value))
                                .font(.custom("Verdana",size:14))
                                .bold()
                                .foregroundColor(.white)
                                .shadow(color:.black,radius: 3)
                            Spacer()
                        }
                    }
                    
                }
                
            }
        }
        
    }
}

