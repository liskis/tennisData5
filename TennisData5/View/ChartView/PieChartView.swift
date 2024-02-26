
import SwiftUI
import Charts

struct PieChartView: View {
    
    @Binding var pieChartData: [PieChartDataModel]
    @Binding var styleScale: KeyValuePairs<String, Color>
    let chartWidth = UIScreen.main.bounds.width/2 - 20
    
    var body: some View {
        ZStack{
            VStack{
                Chart(pieChartData) { dataRow in
                    SectorMark(
                        angle: .value("value", dataRow.value),
                        innerRadius: .ratio(0.4),
                        angularInset: 1
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
                case .oneAndTwoLabels:
                    oneAndTwoLabels
                case .twoAndOneLabels:
                    twoAndOneLabels
                }
                Spacer()
            }
        }
    }
    
    // 二つのラベルを均等に
    private var twoLabels: some View {
        HStack{
            VStack{
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[2].nameString != "init" {
                    Text(String(format: "%.0f",pieChartData[0].value))
                        .font(.custom("Verdana",size:14))
                        .bold()
                        .foregroundColor(.white)
                } else {
                    Text(String(format: "%.0f",0))
                        .font(.custom("Verdana",size:14))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .background(Color.black.opacity(0.5))
            .padding(4)
            .cornerRadius(4)
            Spacer()
            VStack{
                
                Text(pieChartData[1].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[2].nameString != "init" {
                    Text(String(format: "%.0f",pieChartData[1].value))
                        .font(.custom("Verdana",size:14))
                        .bold()
                        .foregroundColor(.white)
                } else {
                    Text(String(format: "%.0f",0))
                        .font(.custom("Verdana",size:14))
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .background(Color.black.opacity(0.5))
            .padding(4)
            .cornerRadius(4)
        }
        .offset(y: chartWidth*0.2)
        .padding(.horizontal,10)
    }
    
    // 三つのラベルを均等に
    private var threeLabels: some View {
        HStack{
            
            VStack{
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[3].nameString != "init" {
                    Text(String(format: "%.1f",pieChartData[0].value))
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
            .background(Color.black.opacity(0.5))
            .cornerRadius(4)
            .offset(y:chartWidth*0.2)
            
            Spacer().frame(height: chartWidth*0.1)
            
            VStack{
                Text(pieChartData[1].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[3].nameString != "init" {
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
            .background(Color.black.opacity(0.5))
            .cornerRadius(4)
            .offset(x:-chartWidth*0.2)
            Spacer()
            
            VStack{
                Text(pieChartData[2].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                if pieChartData[3].nameString != "init" {
                    Text(String(format: "%.1f",pieChartData[2].value))
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
            .background(Color.black.opacity(0.5))
            .cornerRadius(4)
            .offset(y:chartWidth*0.1)
            
        }
    }
    
    // 左に一つ右に二つ
    private var oneAndTwoLabels: some View {
        HStack{
            Spacer().frame(width: 20)
            VStack{
                Text(pieChartData[0].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .background(Color.black.opacity(0.5))
            .offset(y:chartWidth*0.1)
            
            Spacer()
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                .offset(x:-chartWidth*0.2)
                VStack{
                    Text(pieChartData[2].nameString)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
            }
            Spacer().frame(width: 20)
        }
    }
    
    // 左に二つ右に一つ
    private var twoAndOneLabels: some View {
        HStack{
            Spacer().frame(width: 20)
            VStack(spacing:1){
                VStack{
                    Text(pieChartData[1].nameString)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                .offset(x:chartWidth*0.2)
                VStack{
                    Text(pieChartData[0].nameString)
                        .font(.custom("Verdana",size:10))
                        .bold()
                        .foregroundColor(.white)
                }
                .background(Color.black.opacity(0.5))
                Spacer()
            }
            Spacer()
            VStack{
                Text(pieChartData[2].nameString)
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .background(Color.black.opacity(0.5))
            .offset(y:-chartWidth*0.15)
            Spacer().frame(width: 20)
        }
    }
    
}


