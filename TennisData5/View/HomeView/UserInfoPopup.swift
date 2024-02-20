
import SwiftUI

struct UserInfoPopup: View {
    @ObservedObject var dataManageVM: DataManageViewModel
    @ObservedObject var userVM: UserViewModel
    var body: some View {
        VStack(spacing: 8) {
            HStack{
                Text("お名前")
                    .foregroundColor(Color.tungsten)
                    .font(.custom("Verdana",size:14))
                    .bold()
                Spacer()
            }
            TextField("名前を入力してください", text: $userVM.myName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer().frame(height: 8)
            HStack{
                Text("性別").foregroundColor(Color.tungsten)
                    .font(.custom("Verdana",size:14))
                    .bold()
                Spacer()
            }
            Picker("gender", selection: $userVM.gender){
                ForEach(Gender.allCases, id: \.self) { format in
                    Text(format.forString)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(10)
            Spacer().frame(height: 8)
            HStack{
                Text("きき手").foregroundColor(Color.tungsten)
                    .font(.custom("Verdana",size:14))
                    .bold()
                Spacer()
            }
            Picker("dominant", selection: $userVM.dominant){
                ForEach(Dominant.allCases, id: \.self) { format in
                    Text(format.forString)
                }
            }
            .pickerStyle(.segmented)
            .cornerRadius(10)
            Spacer().frame(height: 16)
            Button(action: {
                withAnimation {
                    userVM.updateUserInfo()
                    userVM.showingPopUp = false
                    Task{
                        await dataManageVM.WCUpdateUserInfo()
                    }
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
        .frame(width: 280, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
}


