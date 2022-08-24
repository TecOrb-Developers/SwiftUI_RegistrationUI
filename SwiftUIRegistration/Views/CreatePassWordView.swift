//
//  CreatePassWordView.swift
//  SwiftUi Practice
//
//  Created by Apple on 24/08/22.
//

/*
import SwiftUI

struct CreatePassWordView: View {

    @Environment(\.dismiss) private var dismiss
      var body: some View {
        CreatePassWord()
              .navigationBarBackButtonHidden(true) // Hide default button
              .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))

   }
}

struct CreatePassWordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePassWordView()
    }
}





struct CreatePassWord:View{
    @State var newPassword = ""
    @State var isNewPassword = false
    @State var IsReNewPass = false
    @State var reNewPassword = ""
    var body: some View
    {
        VStack(alignment: .leading){
            Text("Create Password")
                .fontWeight(.bold)
                .padding()
                .frame(width: 350, height: 40,alignment:.leading)
                .font(.system(size: 25))
                
            Text("Enter Password")
                .fontWeight(.semibold)
                .padding()
                .font(.system(size: 20))
//MARK: - NewPasswordTextField
            HStack{
//                if isNewPassword
//                {
                    TextField("New Password", text: $newPassword)
                        .frame(width: 300, height: 45)
                        .padding()
                }
               // else{
                    SecureField("New Password", text: $newPassword)
                        .frame(width: 300, height: 45)
                        .padding()
                }
               
                
                Spacer()
                Button(action: {
                    self.isNewPassword.toggle()
                })
          
                    if isNewPassword
                    {

                        Image("reg_profile_edit_icon-1")
                            .resizable()
                            .scaledToFit()
                            .background(.gray)
                            .foregroundColor(Color.gray)
                    }
                    else
                    {
                        Image("success_tick")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 5)
                            .foregroundColor(Color.black)

                        Image("pass_show-1")
                            .resizable()
                            .scaledToFit()
                    }
                    else
                    {
                        Image("pass_hide-1")
                            .resizable()
                            .scaledToFit()

                    }
            
                }
            }
            .padding(.top,-20)
            
//MARK: - Re-NewPasswordTextField
            
            HStack{
                if IsReNewPass
                {
                    TextField("Re-Enter New Password",text:$reNewPassword)
                        .frame(width: 300, height: 45)
                        .padding()
                }
                else{
                    SecureField("Re-Enter New Password",text:$reNewPassword)
                        .frame(width: 300, height: 45)
                        .padding()
                }
                Spacer()
                Button(action:{
                    self.IsReNewPass.toggle()
                })
                {
                    if IsReNewPass{

                        Image("reg_profile_edit_icon-1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 5)
                            .foregroundColor(Color.black)
                    }
                    else{
                        Image("success_tick")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 4, height: 5)
                            .foregroundColor(Color.black)

                        Image("pass_show-1")
                            .resizable()
                            .scaledToFit()
                    }
                    else{
                        Image("pass_hide-1")
                            .resizable()
                            .scaledToFit()

                    }
                }
                
            }
            .padding(.top,-30)
            
            NavigationLink(destination: OtpView())
            {
                     Text("SUBMIT")

                    .font(.title2)
                    .frame(width: 250, height: 45)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black,lineWidth: 2))
                    .background(.white)
                    .foregroundColor(Color.black)

                    .font(.title3)
                    .frame(width: 360, height: 45)
                    .background(.black)
                    .foregroundColor(Color.white)

                    .cornerRadius(10)
            }
        }
        .padding()

        .padding(.bottom, 300)

       


    }
}
*/
