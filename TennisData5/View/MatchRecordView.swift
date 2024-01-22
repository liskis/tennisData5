import SwiftUI
struct MatchRecordView: View {
    @ObservedObject var recoadSearchVM = RecordSearchViewModel()
//    @FocusState var partnerFocus: Bool
//    @FocusState var opponentFocus: Bool
    var body: some View {
        NavigationStack {
                VStack{
                    Spacer().frame(height:10)
                    HStack{
                        Spacer().frame(width:10)
                        Text("期間")
                        DatePicker("start", selection: $recoadSearchVM.searchStartDate, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ja_JP"))
                            .labelsHidden()
                        Text("〜")
                        DatePicker("end", selection: $recoadSearchVM.seatchEndDate, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ja_JP"))
                            .labelsHidden()
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
                            Text(recoad.matchStartDate)
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
                        .listStyle(.plain)
                    }.background{Color.white}
                
//                partnerPickerView
//                opponentPickerView
                       
               
            }
        .navigationBarTitle("試合履歴", displayMode: .inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark)
        }
        
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
//        .offset(y: opponentFocus ? -224 : UIScreen.main.bounds.height)
    }
}
