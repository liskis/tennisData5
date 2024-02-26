import SwiftUI

struct ChartsLayOutArea: View {
    
    @ObservedObject var matchInfoVM: MatchInfoViewModel
    @ObservedObject var chartDataVM: ChartDataViewModel
    let chartWidth = WKInterfaceDevice.current().screenBounds.size.width / 2
    
    var body: some View {
        VStack{
            Spacer().frame(height: 20)
            firstSvInArea
            Spacer().frame(height: 20)
            secondSvInArea
            Spacer().frame(height: 20)
            doubleFaultArea
            Spacer().frame(height: 20)
            atFirstSvArea
            Spacer().frame(height: 20)
            atSecondSvArea
            Spacer().frame(height:40)
            getAndLostPointArea
            keepAndBreakArea
            pointRateByServiceSideArea
            pointRateByReturnSideArea
            if matchInfoVM.matchFormat == .doubles {
                
                pointRateBySvOrVolyArea
                pointRateByRetOrVolyArea
            }
        }
        .padding(.horizontal,10)
    }
    
    private var firstSvInArea: some View {
        VStack(spacing:0){
            HStack{
                Text("ファーストサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            HStack{
                Text("\(chartDataVM.firstSvInCount)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.firstSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.firstSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var secondSvInArea: some View {
        VStack(spacing:0){
            HStack{
                Text("セカンドサーブの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            HStack{
                Text("\(chartDataVM.secondSvInCount)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.secondSvIn)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.secondSvIn[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var doubleFaultArea: some View {
        VStack(spacing:0) {
            HStack{
                Text("ダブルフォルトの確率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            HStack{
                Text("\(chartDataVM.doubleFaultCount)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.doubleFault)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.doubleFault[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var atFirstSvArea: some View {
        VStack {
            HStack {
                Text("ファーストサーブ時の取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            HStack {
                Text("\(chartDataVM.atFirstSvCount)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atFirstSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atFirstSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var atSecondSvArea: some View {
        VStack (spacing: 0){
            HStack{
                Text("セカンドサーブ時の取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            HStack{
                Text("\(chartDataVM.atSecondSvCount)")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Spacer()
            }
            ZStack{
                BarChartView(barChartData: $chartDataVM.atSecondSv)
                HStack{
                    Spacer().frame(width: 3)
                    Text(String(chartDataVM.atSecondSv[0].value) + "%")
                        .foregroundColor(.white)
                        .font(.custom("Verdana",size:12))
                        .bold()
                    Spacer()
                }
            }
        }
    }
    
    private var getAndLostPointArea: some View {
        ZStack{
            if chartDataVM.getAndLostPoint[2].nameString == "init" {
                PieChartView(
                    pieChartData: $chartDataVM.getAndLostPoint,
                    styleScale: $chartDataVM.styleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.getAndLostPoint,
                    styleScale: $chartDataVM.getAndLostPointStyleScale
                )
            }
            VStack {
                Text("とったポイントと")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("取られたポイント")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
    
    private var keepAndBreakArea:some View {
        ZStack{
            if chartDataVM.keepAndBreak[2].nameString == "init"{
                PieChartView(
                    pieChartData: $chartDataVM.keepAndBreak,
                    styleScale: $chartDataVM.keepAndBreakStyleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.keepAndBreak,
                    styleScale: $chartDataVM.keepAndBreakStyleScale
                )
            }
            VStack {
                Text("キープ率と")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("ブレーク率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
    
    private var pointRateByServiceSideArea: some View {
        ZStack{
            if chartDataVM.pointRateByServiceSide[2].nameString == "init" {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByServiceSide,
                    styleScale: $chartDataVM.styleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByServiceSide,
                    styleScale: $chartDataVM.pointRateStyleScale
                )
            }
            VStack {
                Text("サービスサイド別")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("ポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
    
    private var pointRateByReturnSideArea: some View {
        ZStack{
            if chartDataVM.pointRateByReturnSide[2].nameString == "init"{
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByReturnSide,
                    styleScale: $chartDataVM.styleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByReturnSide,
                    styleScale: $chartDataVM.pointRateStyleScale
                )
            }
            VStack {
                Text("リターンサイド別")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("ポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
    
    private var pointRateBySvOrVolyArea: some View {
        ZStack{
            if chartDataVM.pointRateBySvOrVoly[2].nameString == "init" {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateBySvOrVoly,
                    styleScale: $chartDataVM.styleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateBySvOrVoly,
                    styleScale: $chartDataVM.pointRateStyleScale
                )
            }
            VStack{
                Text("サーバーとボレーヤーの")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("ポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
    
    private var pointRateByRetOrVolyArea: some View {
        ZStack{
            if chartDataVM.pointRateByReturnSide[2].nameString == "init"{
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByRetOrVoly,
                    styleScale: $chartDataVM.styleScaleDis
                )
            } else {
                PieChartView(
                    pieChartData: $chartDataVM.pointRateByRetOrVoly,
                    styleScale: $chartDataVM.pointRateStyleScale
                )
            }
            VStack {
                Text("リターナーとボレーヤーの")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
                Text("ポイント取得率")
                    .font(.custom("Verdana",size:10))
                    .bold()
                    .foregroundColor(.white)
            }
            .offset(y:chartWidth*0.2)
        }
    }
}
