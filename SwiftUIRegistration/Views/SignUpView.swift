//
//  SignUpView.swift
//  SwiftUi Practice
//
//  Created by Apple on 17/08/22.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Signup()
            .navigationBarBackButtonHidden(true) // Hide default button
            .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))
    }
}

struct SignUpView_Previews: PreviewProvider {
 
    static var previews: some View {
        SignUpView()
    }
}


struct Signup: View
{   @State var firstName:String = ""
    @State var lastName:String = ""
    @State var mobileNo:String = ""
    @State var passWord:String = ""
    @State var showAlert:Bool = false
    @State var errorTitle = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View
    {
      
        
        VStack{
            //MARK: - Header
            SignUpHeader()
            //MARK: - Logo
            SignUpLogo()
            //MARK: - TextField
            CustomLabelTextfield(label: "firstName", placeHolder: "Enter Your First Name", secure: false, bVariable: $firstName)
            CustomLabelTextfield(label: "lastName", placeHolder: "Enter the last Name", secure: false, bVariable: $lastName)
            CustomLabelTextfield(label: "Mobile Number", placeHolder: "Enter the Mobile Number ", secure: false, bVariable: $mobileNo)
            CustomLabelTextfield(label: "Password", placeHolder: "Enter The Password", secure: true, bVariable: $passWord)
            
        }
        
        //MARK: - Button Title With Action
        Button(action:
                {
            if self.firstName.isEmpty
            {
                self.errorTitle = "Please Enter First Name"
                self.showAlert = true
            }
            else if !(self.firstName).isValidUserName()
            {
                self.errorTitle = "Please Enter valid First name "
                self.showAlert = true
                
            }
            else if self.lastName.isEmpty
            {
                self.errorTitle = "please Enter Last name "
                self.showAlert = true
                
            }
            else if !(self.lastName).isValidUserName()
            {
                self.errorTitle = "please Enter valid Last name "
                self.showAlert = true
                
            }
            else if self.mobileNo == ""
            {
                self.errorTitle = "Please Enter Mobile Number "
                self.showAlert = true
            }
            else if !(self.mobileNo).isPhoneNumber()
            {
                self.errorTitle = "Please Enter valid Mobile Number "
                self.showAlert = true
                
            }
            else if self.passWord == ""
            {
                self.errorTitle = "Please Enter Password "
                self.showAlert = true
            }
            else if !(self.passWord).isValidPassword()
            {
                self.errorTitle = "Please Enter valid Password of 8 Character In Alphabet ,Small And Special character "
                self.showAlert = true
                //return
                
            }
           
            
            else{
               
                self.errorTitle = " Most Welcome \(self.firstName) Signup Successs "
                self.showAlert = true
               
            }
        })
        {
            ButtonUi()
           
        }
        
        //MARK: - Alert
        .alert(isPresented: $showAlert)
        {
            
            Alert(title: Text(self.errorTitle))
            
        }
    }
}

fileprivate func SignUpHeader() -> some View
{
    return Text("SignUp Screen")
        .fontWeight(.semibold)
        .font(.largeTitle)
        .padding(.top, 10)
}

fileprivate func SignUpLogo() -> some View
{
    return Image("logo")
        .clipped()
        .frame(width: 100, height: 100, alignment: .center)
        .padding(.bottom,20)
}

fileprivate func ButtonUi() -> some View
{
    return Text("SignUp")
        .font(.headline)
        .frame(width: 250, height: 60)
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(10)
        .padding(20)
    
    
}
