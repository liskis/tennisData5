import SwiftUI
import Charts
struct PieChartView: View {
    @Binding var pieChartData: [PieChartDataModel]
    @Binding var styleScale: KeyValuePairs<String, Color>
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width*0.7
    var body: some View {
        ZStack{
            VStack{
                Chart(pieChartData) { dataRow in
                    SectorMark(
                        angle: .value("value", dataRow.value),
                        innerRadius: .ratio(0.5),
                        angularInset: 0.5
                    )
                    .foregroundStyle(by: .value("name", dataRow.name))
                    .cornerRadius(2)
                }
                .chartPlotStyle { content in
                    content
                        .frame(width: chartWidth, height: chartWidth)
                }
                .rotationEffect(.degrees(270))
                .chartLegend(.hidden)
                .chartForegroundStyleScale(styleScale)
                Spacer()
            }
            VStack{
                switch pieChartData[0].labelType {
                case .twoLabels:
                    twoLabels
                case .keepAndBreak:
                    keepAndBreak
                case .oneAndTwoLabels:
                    oneAndTwoLabels
                case .twoAndOneLabels:
                    twoAndOneLabels
                }
                Spacer()
            }
        }
    }
    var twoLabels: some View {
        HStack{
            VStack{
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Text(String(format: "%.0f",pieChartData[0].value))
                    .font(.custom("Verdana",size:12))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(x: -chartWidth*0.2)
            VStack{
                Text(pieChartData[1].nameString)
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                Text(String(format: "%.0f",pieChartData[1].value))
                    .font(.custom("Verdana",size:12))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(x: chartWidth*0.2)
        }
        .offset(y: chartWidth*0.2)
    }
    var keepAndBreak: some View {
        HStack{
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.1f",pieChartData[1].value) + "%")
                        .font(.custom("Verdana",size:12))
                        .bold()
                        .foregroundColor(.white)
                }
                .offset(y: -chartWidth*0.1)
                VStack{
                    Text(pieChartData[0].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.1f",pieChartData[0].value) + "%")
                        .font(.custom("Verdana",size:12))
                        .bold()
                        .foregroundColor(.white)
                }
                .offset(x: -chartWidth*0.2)
            }
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[2].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.1f",pieChartData[2].value) + "%")
                        .font(.custom("Verdana",size:12))
                        .bold()
                        .foregroundColor(.white)
                }
                .offset(y: -chartWidth*0.1)
                VStack{
                    Text(pieChartData[3].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.1f",pieChartData[3].value) + "%")
                        .font(.custom("Verdana",size:12))
                        .bold()
                        .foregroundColor(.white)
                }
                .offset(x: chartWidth*0.2, y: -chartWidth*0.07)
            }
        }
    }
    var oneAndTwoLabels: some View {
        HStack{
            Spacer().frame(width: 1)
            VStack{
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Text(String(format: "%.0f",pieChartData[0].value))
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
            }
            .background(Color.black.opacity(0.5))
            .offset(y:chartWidth*0.1)
            
            Spacer()
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:6))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.0f",pieChartData[1].value))
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                .offset(x:-chartWidth*0.2)
                VStack{
                    Text(pieChartData[2].nameString)
                        .font(.custom("Verdana",size:6))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.0f",pieChartData[2].value))
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
            }
            Spacer().frame(width: 1)
        }
    }
    var twoAndOneLabels: some View {
        HStack{
            Spacer().frame(width: 1)
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:6))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.0f",pieChartData[1].value))
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                .offset(x:chartWidth*0.2)
                VStack{
                    Text(pieChartData[0].nameString)
                        .font(.custom("Verdana",size:6))
                        .bold()
                        .foregroundColor(.white)
                    Text(String(format: "%.0f",pieChartData[0].value))
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                Spacer()
            }
            Spacer()
            VStack{
                Text(pieChartData[2].nameString)
                    .font(.custom("Verdana",size:6))
                    .bold()
                    .foregroundColor(.white)
                Text(String(format: "%.0f",pieChartData[2].value))
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
            }
            .background(Color.black.opacity(0.5))
            .offset(y:-chartWidth*0.15)
            Spacer().frame(width: 1)
        }
    }
    
}


