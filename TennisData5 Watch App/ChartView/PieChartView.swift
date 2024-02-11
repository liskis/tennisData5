import SwiftUI
import Charts
struct PieChartView: View {
    @Binding var pieChartData: [PieChartDataModel]
    @Binding var styleScale: KeyValuePairs<String, Color>
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width / 2 - 20
    var body: some View {
        ZStack{
            VStack{
                Chart(pieChartData) { dataRow in
                    SectorMark(
                        angle: .value("value", dataRow.value),
                        innerRadius: .ratio(0.4),
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
                case .threeLabels:
                    threeLabels
                case .keepAndBreak:
                    keepAndBreak
                case .oneAndTwoLabels:
                    twoLabels
                case .twoAndOneLabels:
                    twoLabels
                }
                Spacer()
            }
        }
    }
    var twoLabels: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[2].nameString != "init" {
                    Text(String(format: "%.0f",pieChartData[0].value))
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                } else {
                    Text(String(format: "%.0f",0))
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            Spacer()
            VStack(spacing: 0){
                Text(pieChartData[1].nameString)
                    .font(.custom("Verdana",size:8))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[2].nameString != "init" {
                Text(String(format: "%.0f",pieChartData[1].value))
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                } else {
                    Text(String(format: "%.0f",0))
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
            }
        }
        .offset(y: chartWidth*0.2)
        .padding(.horizontal,10)
    }
    var threeLabels: some View {
        HStack(spacing: 0){
                VStack(spacing: 0){
                    Text(pieChartData[0].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[3].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[0].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(y:chartWidth*0.2)
                Spacer().frame(height: chartWidth*0.1)
                VStack(spacing: 0){
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[3].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[1].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(x:-chartWidth*0.2)
                Spacer()
                VStack(spacing: 0){
                    Text(pieChartData[2].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[3].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[2].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(y:chartWidth*0.1)
                
        }
    }
    var keepAndBreak: some View {
        HStack{
            VStack(spacing:0){
                VStack(spacing:0){
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[4].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[1].value))
                            .font(.custom("Verdana",size:14))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:14))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(x:-chartWidth*0.1)
                Spacer().frame(height: chartWidth*0.1)
                VStack(spacing:0){
                    Text(pieChartData[0].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[4].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[0].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(x:-chartWidth*0.1)
                Spacer()
            }
            VStack(spacing:0){
                VStack(spacing:0){
                    Text(pieChartData[2].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[4].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[2].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(x:chartWidth*0.1)
                VStack(spacing:0){
                    Text(pieChartData[3].nameString)
                        .font(.custom("Verdana",size:8))
                        .bold()
                        .foregroundColor(.white)
                    if pieChartData[4].nameString != "init" {
                        Text(String(format: "%.1f",pieChartData[3].value))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    } else {
                        Text(String(format: "%.1f",0))
                            .font(.custom("Verdana",size:10))
                            .bold()
                            .foregroundColor(.white)
                    }
                }
                .offset(x:chartWidth*0.1)
                Spacer()
            }
        }
    }
    
}


