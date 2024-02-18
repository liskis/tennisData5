import SwiftUI
struct MatchRecordView: View {
    @ObservedObject var recoadSearchVM = RecordSearchViewModel()
    @FocusState private var searchStartDatePickerFocus: Bool
    @FocusState private var searchEndDatePickerFocus: Bool
    @FocusState private var partnerFocus: Bool
    @FocusState private var opponentFocus: Bool
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
                        .disabled(true)
                    TextField("対戦相手で検索", text: $recoadSearchVM.opponent)
                        .textFieldStyle(.roundedBorder)
                        .focused($opponentFocus)
                        .padding(.horizontal,10)
                        .disabled(true)
                    //                    List(recoadSearchVM.matchRecoad){ recoad in
                    //                        if checkPeriod(recoad: recoad) && checkMatchFormat(recoad: recoad) && checkGameType(recoad: recoad) {
                    //                            NavigationLink(
                    //                                destination: OneMatchDataView(
                    //                                    homeVM: recoadSearchVM.homeVM,
                    //                                    pointVM: recoadSearchVM.pointVM,
                    //                                    matchInfoVM: recoadSearchVM.matchInfoVM,
                    //                                    chartDataVM: recoadSearchVM.chartDataVM
                    //                                )
                    //                                .onAppear{
                    //                                    recoadSearchVM.matchInfoVM.matchId = recoad.matchId
                    //                                    recoadSearchVM.matchInfoVM.matchFormat = recoad.matchFormat
                    //                                    recoadSearchVM.matchInfoVM.gameType = recoad.gameType
                    //                                    recoadSearchVM.matchInfoVM.matchStartDate = recoad.matchStartDate
                    //                                    recoadSearchVM.pointVM.getGameCount = recoad.WinScore
                    //                                    recoadSearchVM.pointVM.lostGameCount = recoad.LoseScore
                    //                                    recoadSearchVM.pointVM.drowGameCount = recoad.DrawScore
                    //                                }
                    //                            ) {
                    //                                HStack {
                    //                                    if recoad.matchFormat == .singles {
                    //                                        VStack{
                    //                                            Image(.singles)
                    //                                                .resizable()
                    //                                                .scaledToFit()
                    //                                                .frame(height: 20)
                    //                                            Text("シングルス")
                    //                                                .foregroundColor(Color.tungsten)
                    //                                                .font(.custom("Verdana", size: 8))
                    //                                                .bold()
                    //                                        }
                    //                                    } else {
                    //                                        VStack{
                    //                                            Image(.doubles)
                    //                                                .resizable()
                    //                                                .scaledToFit()
                    //                                                .frame(height: 20)
                    //                                            Text("ダブルス　")
                    //                                                .foregroundColor(Color.tungsten)
                    //                                                .font(.custom("Verdana", size: 8))
                    //                                                .bold()
                    //                                        }
                    //                                    }
                    //                                    Text(Date.DateToString(date:recoad.matchStartDate))
                    //                                        .foregroundColor(Color.tungsten)
                    //                                        .font(.custom("Verdana", size: 10))
                    //                                        .frame(width:60)
                    //                                    Spacer()
                    //                                    Text(recoad.gameType.forString)
                    //                                        .foregroundColor(Color.tungsten)
                    //                                        .font(.custom("Verdana", size: 10))
                    //                                    Spacer()
                    //                                    Text("\(recoad.WinScore)勝\(recoad.LoseScore)敗\(recoad.DrawScore)分" )
                    //                                        .foregroundColor(Color.tungsten)
                    //                                        .font(.custom("Verdana", size: 10))
                    //                                    Spacer()
                    //                                    if recoad.WinScore > recoad.LoseScore {
                    //                                        Text("Win")
                    //                                            .foregroundColor(Color.red)
                    //                                            .font(.custom("Verdana", size: 12))
                    //                                            .bold()
                    //                                            .frame(width:40)
                    //                                    } else if recoad.WinScore < recoad.LoseScore {
                    //                                        Text("Lose")
                    //                                            .foregroundColor(Color.blue)
                    //                                            .font(.custom("Verdana", size: 12))
                    //                                            .bold()
                    //                                            .frame(width:40)
                    //                                    } else {
                    //                                        Text("Draw")
                    //                                            .foregroundColor(Color.gray)
                    //                                            .font(.custom("Verdana", size: 12))
                    //                                            .bold()
                    //                                            .frame(width:40)
                    //                                    }
                    //                                }
                    //                            }
                    //                            .listStyle(.plain)
                    //                        }
                    //                    }.background{Color.white}
                    //                }
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
                Text("Please wait for update !")
                    .frame(width: 180,height: 20)
                    .bold()
                    .italic()
                    .font(.custom("Verdana", size: 12))
                    .foregroundColor(.red)
                    .background(Color.yellow)
                    .rotationEffect(.degrees(-10))
            }
        .navigationBarTitle("試合履歴", displayMode: .inline)
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
    var searchEndDatePicker: some View {
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
extension MatchRecordView{
    func checkPeriod(recoad:MatchRecordModel) -> Bool {
        return recoad.matchStartDate > recoadSearchVM.searchStartDate.zeroClock &&
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
