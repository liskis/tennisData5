
import SwiftUI

struct DataAnalysisView: View {
    
    @ObservedObject var homeVM: HomeViewModel
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
                    searchPeriod
                    Spacer().frame(height:10)
                    selectMatchFormat
                    selectGameType
                    selectPartner
                    selectOpponent
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
                Text("Please wait for update !")
                    .frame(width: 180,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-10))
//                if homeVM.adMobPopUp {
//                    AdMobPopUp(homeVM: homeVM)
//                }
            }
            .navigationBarTitle("データ分析", displayMode: .inline)
            .toolbarBackground(.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark)
        }
    }
    
    private var searchPeriod: some View {
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
    }
    
    private var selectMatchFormat: some View {
        Picker("matchFormat", selection: $recoadSearchVM.matchInfoVM.matchFormat){
            ForEach(MatchFormat.allCases, id: \.self) { format in
                Text(format.forString)
            }
        }
        .pickerStyle(.segmented)
        .cornerRadius(10)
        .padding(.horizontal,10)
    }
    
    private var selectGameType: some View {
        Picker("gameType", selection: $recoadSearchVM.matchInfoVM.gameType){
            ForEach(GameType.allCases, id: \.self) { format in
                Text(format.forString)
            }
        }
        .pickerStyle(.segmented)
        .cornerRadius(10)
        .padding(.horizontal,10)
    }
    
    private var selectPartner: some View {
        TextField("パートナーで検索", text: $recoadSearchVM.partner)
            .textFieldStyle(.roundedBorder)
            .focused($partnerFocus)
            .padding(.horizontal,10)
            .disabled(true)
    }
    
    private var selectOpponent: some View {
        TextField("対戦相手で検索", text: $recoadSearchVM.opponent)
            .textFieldStyle(.roundedBorder)
            .focused($opponentFocus)
            .padding(.horizontal,10)
            .disabled(true)
    }
    
    private var searchStartDatePicker: some View {
        VStack{
            Spacer().frame(height: 10)
            HStack{
                Spacer()
                Button(action: {
                    recoadSearchVM.searchStartDateString = Date.DateToString(date: recoadSearchVM.searchStartDate)
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
    
    private var searchEndDatePicker: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    recoadSearchVM.searchEndDateString = Date.DateToString(date: recoadSearchVM.searchEndDate)
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
    
    private var partnerPickerView: some View {
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
                Text("パートナーを選んでくださいね")
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
    
    private var opponentPickerView: some View {
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
                Text("対戦相手を選んでくださいね")
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
        recoad.matchStartDate <= recoadSearchVM.searchEndDate.endClock
    }
    func checkMatchFormat(recoad:MatchRecordModel) -> Bool {
        return recoadSearchVM.matchInfoVM.matchFormat == .noSelection ||
        recoadSearchVM.matchInfoVM.matchFormat == recoad.matchFormat
    }
    func checkGameType(recoad:MatchRecordModel) -> Bool {
        recoadSearchVM.matchInfoVM.gameType == .noSelection ||
            recoadSearchVM.matchInfoVM.gameType == recoad.gameType
    }
    
    
}
