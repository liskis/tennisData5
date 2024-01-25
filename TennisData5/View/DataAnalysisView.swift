import SwiftUI
struct DataAnalysisView: View {
    @ObservedObject var recoadSearchVM = RecordSearchViewModel()
    
    @FocusState private var searchStartDatePickerFocus: Bool
    @FocusState private var searchEndDatePickerFocus: Bool
    @FocusState private var partnerFocus: Bool
    @FocusState var opponentFocus: Bool
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
                    Picker("matchFormat", selection: $recoadSearchVM.matchInfoVM.matchFormat){
                        ForEach(MatchFormat.allCases, id: \.self) { format in
                            Text(format.forString)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    Picker("gameType", selection: $recoadSearchVM.matchInfoVM.gameType){
                        ForEach(GameType.allCases, id: \.self) { format in
                            Text(format.forString)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    TextField("パートナーで検索", text: $recoadSearchVM.partner)
                        .textFieldStyle(.roundedBorder)
                        .focused($partnerFocus)
                        .padding(.horizontal,10)
                    TextField("対戦相手で検索", text: $recoadSearchVM.opponent)
                        .textFieldStyle(.roundedBorder)
                        .focused($opponentFocus)
                        .padding(.horizontal,10)
                    ScrollView {
                        ChartsLayOutArea(matchInfoVM: recoadSearchVM.matchInfoVM, chartDataVM: recoadSearchVM.chartDataVM)
                    }
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
                VStack{
                    Spacer()
                    partnerPickerView
                        .animation(.linear,value:10)
                        .offset(y: self.partnerFocus ? 0 : UIScreen.main.bounds.height)
                }
                VStack{
                    Spacer()
                    opponentPickerView
                        .animation(.linear,value:10)
                        .offset(y: self.opponentFocus ? 0 : UIScreen.main.bounds.height)
                }
            }
            .navigationBarTitle("データ分析", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }
    }
    var searchStartDatePicker: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Spacer()
                Button(action: {
                    recoadSearchVM.searchStartDateString = DateToString(date: recoadSearchVM.searchStartDate)
                    searchStartDatePickerFocus = false
                }, label: {
                    Text("決定")
                        .font(.custom("Verdana",size:20))
                        .foregroundColor(.blue)
                })
                .padding(.trailing,15)
            }
            DatePicker("start", selection: $recoadSearchVM.searchStartDate, displayedComponents: .date)
                .environment(\.locale, Locale(identifier: "ja_JP"))
                .labelsHidden()
                .accentColor(.ocean)
                .datePickerStyle(WheelDatePickerStyle())
        }.background(Color.silver)
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
        }.background(Color.silver)
    }
    var partnerPickerView: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    partnerFocus = false
                }, label: {
                    Text("決定")
                        .font(.custom("Verdana",size:16))
                        .foregroundColor(.blue)
                })
                .padding(.trailing,15)
            }
            Picker("パートナー", selection: $recoadSearchVM.partner) {
                Text("-")
                    .tag("-")
                    .font(.custom("Verdana",size:12))
//                Text("渡辺")
//                    .tag("12345")
//                    .font(.custom("Verdana",size:12))
//                Text("渡瀬")
//                    .tag("67890")
//                    .font(.custom("Verdana",size:12))
//                Text("石川")
//                    .tag("23456")
//                    .font(.custom("Verdana",size:12))
            }
            .pickerStyle(.wheel)
            .foregroundColor(.tungsten)
        }.background(Color.silver)
    }
    var opponentPickerView: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    opponentFocus = false
                }, label: {
                    Text("決定")
                        .font(.custom("Verdana",size:16))
                        .foregroundColor(.blue)
                })
                .padding(.trailing,15)
            }
            Picker("対戦相手", selection: $recoadSearchVM.opponent) {
                Text("-")
                    .tag("-")
                    .font(.custom("Verdana",size:12))
//                Text("渡辺")
//                    .tag("12345")
//                    .font(.custom("Verdana",size:12))
//                Text("渡瀬")
//                    .tag("67890")
//                    .font(.custom("Verdana",size:12))
//                Text("石川")
//                    .tag("23456")
//                    .font(.custom("Verdana",size:12))
            }
            .pickerStyle(.wheel)
            .foregroundColor(.tungsten)
        }.background(Color.silver)
    }
}
extension DataAnalysisView{
    func checkPeriod(recoad:MatchRecordModel) -> Bool {
        return recoad.matchStartDate > recoadSearchVM.searchStartDate &&
            recoad.matchStartDate <= pulus1day(date: recoadSearchVM.searchEndDate)
    }
    func checkMatchFormat(recoad:MatchRecordModel) -> Bool {
        return recoadSearchVM.matchInfoVM.matchFormat == .noSelection ||
        recoadSearchVM.matchInfoVM.matchFormat == recoad.matchFormat
    }
    func checkGameType(recoad:MatchRecordModel) -> Bool {
        recoadSearchVM.matchInfoVM.gameType == .noSelection ||
            recoadSearchVM.matchInfoVM.gameType == recoad.gameType
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
