import SwiftUI
struct MatchRecordView: View {
    @ObservedObject var recoadSearchVM = RecordSearchViewModel()
    @ObservedObject var pointVM = PointViewModel()
    @ObservedObject var matchInfoVM = MatchInfoViewModel()
    @ObservedObject var chartDataVM = ChartDataViewModel()
    @FocusState private var searchStartDatePickerFocus: Bool
    @FocusState private var searchEndDatePickerFocus: Bool
//    @FocusState var partnerFocus: Bool
//    @FocusState var opponentFocus: Bool
    var body: some View {
        NavigationStack {
            ZStack {
                VStack{
                    Spacer().frame(height:10)
                    HStack{
                        Spacer().frame(width:10)
                        Text("期間")
                        TextField(recoadSearchVM.searchStartDateString, text: $recoadSearchVM.searchStartDateString)
                            .focused($searchStartDatePickerFocus)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(TextAlignment.trailing)
                        Text("〜")
                        TextField(recoadSearchVM.searchEndDateString, text: $recoadSearchVM.searchEndDateString)
                            .focused($searchEndDatePickerFocus)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .multilineTextAlignment(TextAlignment.trailing)
                        Spacer().frame(width:10)
                    }
                    Spacer().frame(height:10)
                    Picker("matchFormat", selection: $recoadSearchVM.matchFormat){
                        ForEach(MatchFormat.allCases, id: \.self) { format in
                            Text(format.forString)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    Picker("gameType", selection: $recoadSearchVM.gameType){
                        ForEach(GameType.allCases, id: \.self) { format in
                            Text(format.forString)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    TextField("パートナーで検索", text: $recoadSearchVM.partner)
                        .textFieldStyle(.roundedBorder)
                    //                        .focused($partnerFocus)
                        .padding(.horizontal,10)
                        .disabled(true)
                    TextField("対戦相手で検索", text: $recoadSearchVM.opponent)
                        .textFieldStyle(.roundedBorder)
                    //                        .focused($opponentFocus)
                        .padding(.horizontal,10)
                        .disabled(true)
                    List(recoadSearchVM.matchRecoad){ recoad in
                        if checkPeriod(recoad: recoad) && checkMatchFormat(recoad: recoad) && checkGameType(recoad: recoad) {
                            NavigationLink(
                                destination: OneMatchDataView(pointVM: pointVM, matchInfoVM: matchInfoVM)
                                    .onAppear{
                                        matchInfoVM.matchId = recoad.matchId
                                        matchInfoVM.matchFormat = recoad.matchFormat
                                        matchInfoVM.gameType = recoad.gameType
                                        matchInfoVM.matchStartDate = recoad.matchStartDate
                                        pointVM.winCount = recoad.WinScore
                                        pointVM.loseCount = recoad.LoseScore
                                        pointVM.drowCount = recoad.DrawScore
                                    }
                            ) {
                                HStack {
                                    if recoad.matchFormat == .singles {
                                        VStack{
                                            Image(.singles)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 20)
                                            Text("シングルス")
                                                .foregroundColor(Color.tungsten)
                                                .font(.custom("Verdana", size: 8))
                                                .bold()
                                        }
                                    } else {
                                        VStack{
                                            Image(.doubles)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(height: 20)
                                            Text("ダブルス　")
                                                .foregroundColor(Color.tungsten)
                                                .font(.custom("Verdana", size: 8))
                                                .bold()
                                        }
                                    }
                                    Text(DateToString(date:recoad.matchStartDate))
                                        .foregroundColor(Color.tungsten)
                                        .font(.custom("Verdana", size: 10))
                                        .frame(width:60)
                                    Spacer()
                                    Text(recoad.gameType.forString)
                                        .foregroundColor(Color.tungsten)
                                        .font(.custom("Verdana", size: 10))
                                    Spacer()
                                    Text("\(recoad.WinScore)勝\(recoad.LoseScore)敗\(recoad.DrawScore)分" )
                                        .foregroundColor(Color.tungsten)
                                        .font(.custom("Verdana", size: 10))
                                    Spacer()
                                    if recoad.WinScore > recoad.LoseScore {
                                        Text("Win")
                                            .foregroundColor(Color.red)
                                            .font(.custom("Verdana", size: 12))
                                            .bold()
                                            .frame(width:40)
                                    } else if recoad.WinScore < recoad.LoseScore {
                                        Text("Lose")
                                            .foregroundColor(Color.blue)
                                            .font(.custom("Verdana", size: 12))
                                            .bold()
                                            .frame(width:40)
                                    } else {
                                        Text("Draw")
                                            .foregroundColor(Color.gray)
                                            .font(.custom("Verdana", size: 12))
                                            .bold()
                                            .frame(width:40)
                                    }
                                }
                            }
                            .listStyle(.plain)
                        }
                    }.background{Color.white}
                }
                VStack{
                    Spacer()
                    searchStartDatePicker
                        .animation(.linear,value:10)
                        .offset(y: self.searchStartDatePickerFocus ? 0 : UIScreen.main.bounds.height)
                }
                VStack{
                    Spacer()
                    searchEndDatePicker
                        .animation(.linear,value:10)
                        .offset(y: self.searchEndDatePickerFocus ? 0 : UIScreen.main.bounds.height)
                }
            }
        .navigationBarTitle("試合履歴", displayMode: .inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark)
        }
    }
    var searchStartDatePicker: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    recoadSearchVM.searchStartDateString = DateToString(date: recoadSearchVM.searchStartDate)
                    searchStartDatePickerFocus = false
                }, label: {
                    Text("決定")
                        .font(.custom("Verdana",size:16))
                        .foregroundColor(.blue)
                })
                .padding(.trailing,15)
            }
            DatePicker("start", selection: $recoadSearchVM.searchStartDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .labelsHidden()
                .accentColor(.ocean)
                .datePickerStyle(WheelDatePickerStyle())
        }.background(Color.magnesium)
    }
    var searchEndDatePicker: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    recoadSearchVM.searchEndDateString = DateToString(date: recoadSearchVM.searchEndDate)
                    searchEndDatePickerFocus = false
                }, label: {
                    Text("決定")
                        .font(.custom("Verdana",size:16))
                        .foregroundColor(.blue)
                })
                .padding(.trailing,15)
            }
            DatePicker("start", selection: $recoadSearchVM.searchEndDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .labelsHidden()
                .accentColor(.ocean)
                .datePickerStyle(WheelDatePickerStyle())
        }.background(Color.magnesium)
    }
    var partnerPickerView: some View {
        Picker("パートナー", selection: $recoadSearchVM.partner) {
            Text("渡辺")
                .tag("0")
                .font(.custom("Verdana",size:12))
            Text("渡瀬")
                .tag("1")
                .font(.custom("Verdana",size:12))
            Text("石川")
                .tag("2")
                .font(.custom("Verdana",size:12))
        }
        .pickerStyle(.wheel)
        .foregroundColor(.tungsten)
        .background(Color.mercury)
        .animation(.linear, value: 10)
//        .offset(y: partnerFocus ? 0 : UIScreen.main.bounds.height)
    }
    var opponentPickerView: some View {
        Picker("対戦相手", selection: $recoadSearchVM.opponent) {
            Text("渡辺")
                .tag("0")
                .font(.custom("Verdana",size:12))
            Text("渡瀬")
                .tag("1")
                .font(.custom("Verdana",size:12))
            Text("石川")
                .tag("2")
                .font(.custom("Verdana",size:12))
        }
        .pickerStyle(.wheel)
        .foregroundColor(.tungsten)
        .background(Color.mercury)
        .animation(.linear, value: 10)
//        .offset(y: opponentFocus ? 0 : UIScreen.main.bounds.height)
    }
    
}
extension MatchRecordView{
    func checkPeriod(recoad:MatchRecordModel) -> Bool {
        return recoad.matchStartDate > recoadSearchVM.searchStartDate &&
            recoad.matchStartDate <= pulus1day(date: recoadSearchVM.searchEndDate)
    }
    func checkMatchFormat(recoad:MatchRecordModel) -> Bool {
        return recoadSearchVM.matchFormat == .noSelection ||
        recoadSearchVM.matchFormat == recoad.matchFormat
    }
    func checkGameType(recoad:MatchRecordModel) -> Bool {
        recoadSearchVM.gameType == .noSelection ||
            recoadSearchVM.gameType == recoad.gameType
    }
    
    func DateToString(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ja_JP")
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
    func StringToDate(date: String) -> Date {
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: date) ?? Date()
        }
    func pulus1day(date:Date) -> Date {
        return Calendar.current.date(byAdding: .day, value: +1, to: date) ?? Date()
    }
}
