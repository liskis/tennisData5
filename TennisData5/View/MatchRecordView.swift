import SwiftUI
struct MatchRecordView: View {
    @ObservedObject var recoadSearchVM = RecordSearchViewModel()
    @FocusState var partnerFocus: Bool
    @FocusState var opponentFocus: Bool
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack{
                Text("試合履歴")
                    .font(.custom("Verdana",size:15))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                VStack{
                    Spacer().frame(height:10)
                    HStack{
                        Spacer()
                        DatePicker("期間", selection: $recoadSearchVM.searchStartDate, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ja_JP"))
                        Text("〜")
                        DatePicker("〜", selection: $recoadSearchVM.seatchEndDate, displayedComponents: .date)
                            .environment(\.locale, Locale(identifier: "ja_JP"))
                            .labelsHidden()
                        Spacer()
                    }
                    Spacer().frame(height:10)
                    Picker("matchFormat", selection: $recoadSearchVM.matchFormat){
                        ForEach(MatchFormat.allCases, id: \.self) { format in
                            Text(format.selectionName)
                        }
                    }
                    .pickerStyle(.segmented)
                    .cornerRadius(10)
                    .padding(.horizontal,10)
                    TextField("パートナーを選択", text: $recoadSearchVM.partner)
                        .textFieldStyle(.roundedBorder)
                        .focused($partnerFocus)
                        .padding(.horizontal,10)
                    TextField("対戦相手を選択", text: $recoadSearchVM.opponent)
                        .textFieldStyle(.roundedBorder)
                        .focused($opponentFocus)
                        .padding(.horizontal,10)
                    partnerPickerView
                    opponentPickerView
                    Spacer()
                }.background{Color.white}
                
            }
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
        .offset(y: partnerFocus ? 0 : UIScreen.main.bounds.height)
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
        .offset(y: opponentFocus ? -224 : UIScreen.main.bounds.height)
    }
}
