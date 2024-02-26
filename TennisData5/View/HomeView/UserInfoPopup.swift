
import SwiftUI

struct UserInfoPopup: View {
    
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var userVM: UserViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            inputNameTitle
            inputNameTextFierld
            Spacer().frame(height: 8)
            genderTitle
            genderPicer
            Spacer().frame(height: 8)
            dominantTitle
            dominantPicker
            Spacer().frame(height: 16)
            updateMyInfoBtn
        }
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
    private var inputNameTitle: some View {
        HStack{
            Text("お名前")
                .foregroundColor(Color.tungsten)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
    
    private var inputNameTextFierld: some View {
        TextField("名前を入力してください", text: $userVM.myName)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .accentColor(Color.tungsten)
    }
    
    private var genderTitle: some View {
        HStack{
            Text("性別").foregroundColor(Color.tungsten)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
    
    private var genderPicer: some View {
        Picker("gender", selection: $userVM.gender){
            ForEach(Gender.allCases, id: \.self) { format in
                Text(format.forString)
            }
        }
        .pickerStyle(.segmented)
        .cornerRadius(10)
    }
    
    private var dominantTitle: some View {
        HStack{
            Text("きき手").foregroundColor(Color.tungsten)
                .font(.custom("Verdana",size:14))
                .bold()
            Spacer()
        }
    }
    
    private var dominantPicker: some View {
        Picker("dominant", selection: $userVM.dominant){
            ForEach(Dominant.allCases, id: \.self) { format in
                Text(format.forString)
            }
        }
        .pickerStyle(.segmented)
        .cornerRadius(10)
    }
    
    private var updateMyInfoBtn: some View {
        Button(action: {
            withAnimation {
                userVM.updateUserInfo()
                Task{
                    await dataManageVM.WCUpdateUserInfo()
                }
                userVM.showingPopUp = false
            }
        }, label: {
            Text("OK")
                .foregroundColor(Color.white)
                .bold()
                .font(.custom("Verdana", size: 12))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background{Color.ocean}
                .cornerRadius(4)
        })
    }
}


