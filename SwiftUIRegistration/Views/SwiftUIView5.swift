//
//  SwiftUIView5.swift
//  SwiftUi Practice
//
//  Created by Apple on 16/08/22.
//

import SwiftUI
struct SwiftUIView5: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors: [.blue,.red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            loginView()
            
        }
        .navigationBarBackButtonHidden(true) // Hide default button
        .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))
    }
}

struct SwiftUIView5_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView5()
    }
}

struct loginView: View {
    @State var index = 0
    @State private var success = false
    @State var moveData:Bool = false
    
    var body: some View {
        VStack(spacing: 20){
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.top,-80)
            Text("HOMP")
            
            Text("Sign In").multilineTextAlignment(.leading)
                .font(.largeTitle)
                .padding(.top,-20)
            
            HStack{
                Button(action: {
                    
                    self.index = 0
                })
                {
                    Text("Existing")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.semibold)
                        .padding(.vertical , 10)
                        .frame(width: (UIScreen.main.bounds.width - 40) / 2)
                    
                }        .background(self.index == 0 ? Color.white :          Color.red)
                    .clipShape(Capsule())
                
                Button(action:{
                    self.index = 1
                    self.moveData = true
                    
                })
                {
                    Text("New")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.semibold)
                        .padding(.vertical , 10)
                        .frame(width: (UIScreen.main.bounds.width - 40) / 2)
                    
                }
                .background(self.index == 1 ? Color.white : Color.red)
                .clipShape(Capsule())
                //   navigation(text: "", nextView: SignUpView())
                // MARK: - For Presenting View
                .sheet(isPresented: $moveData)
                {
                    SignUpView()
                        .ignoresSafeArea(.all)
                }
                
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule())
            .padding(.bottom,20)
            login()
            
        }
        .padding(.top, -110)
        
        
    }
}

struct login : View {
    @State var name:String = ""
    @State var Email:String = ""
    @State var Mobile:String = ""
    @State var showAlert:Bool = false
    @State var errorTitle = ""
    @State private var selectedCountry: String = ""
    @State private var IsActive = false
    
    var body: some View
    {
        
        VStack{
            
            HStack(){
                
                //MARK: = textField CountryCode Mobile Number
                Button(action:
                        {
                    
                    if selectedCountry != "" {
                        Text(Locale.current.localizedString(forRegionCode: selectedCountry) ?? selectedCountry)
                            .font(.system(size: 17))
                        //.foregroundColor(Color.gray)
                    } else {
                        Text("+91")
                            .font(.system(size: 17))
                        // .foregroundColor(Color.black)
                        
                    }
   
                })
                {
                    Picker("Country", selection: $selectedCountry) {
                        ForEach(getLocales(), id: \.id) { country in
                            Text(country.id).tag(country.id)
                            //  Text(country.phoneCode).tag(country.phoneCode)
                        }
                    }
                }
                
                TextField("Enter Mobile No", text: $Mobile)
                    .frame(width: 300, height: 45)
            }
            
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(.blue,lineWidth: 1))
            
            TextField("Enter name ", text: $name)
                .padding()
                .frame(width: 340, height: 45)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue,lineWidth: 1))
            
            
            TextField("Enter Email", text: $Email)
                .padding()
                .frame(width: 340, height: 45)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue,lineWidth: 1))
            
            
        }
        //.edgesIgnoringSafeArea(.top)
        //MARK: - Term And Conditon
        HStack{
            Text("By Continuing,You Agree to the")
            Button(action: {})
            {
                Text("Terms")
                    .foregroundColor(Color.white)
            }
            Text("and")
        }
        HStack{
            Button(action: {})
            {
                Text("Policy")
                    .foregroundColor(Color.white)
            }
            Text("Of Homp")
        }
        .padding(.bottom, 20)
        //MARK: -  SignIn Button
        
        Button(action: {
            self.validation()
            self.IsActive = true
        })
        {
            Text("SIGN IN")
                .frame(minWidth: 0, maxWidth: 100)
                .font(.system(size: 15))
                .padding()
                .foregroundColor(.white)
                .shadow(color: .black, radius: 25, x: 0, y: 0)
                .opacity(1)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.white, lineWidth: 1)
                )
        }
        
        
        .alert(isPresented: $showAlert)
        {
            Alert(title: Text(self.errorTitle))
        }
        
        navigation(text:"FORGOT PASSWORD?", nextView: ForgotPasswordView())
            .foregroundColor(Color.white)
        
    }
    
    
    //MARK: - VAlidation
    func validation()
    {
        if self.Mobile.isEmpty
        {
            self.errorTitle = "Please enter number"
            self.showAlert = true
        }
        else if !self.Mobile.isNumber()
        {
            self.errorTitle = "Please enter the valid Number"
            self.showAlert = true
        }
        else if self.name.isEmpty
        {
            self.errorTitle = "Please enter the name"
            self.showAlert = true
        }
        else if !self.name.isValidUserName()
        {
            self.errorTitle = "Please enter the valid name"
            self.showAlert = true
        }
        else if self.Email.isEmpty
        {
            self.errorTitle = "Please enter Email"
            self.showAlert = true
        }
        else if !self.Email.isEmail()
        {
            self.showAlert = true
            self.errorTitle = "Please enter the valid Email"
        }
        
    }
}

//MARK: -For Country Picker
fileprivate struct Country {
    var id: String
    var name: String
    var phoneCode:String
}

fileprivate func getLocales() -> [Country] {
    let locales = Locale.isoRegionCodes
        .filter { $0 != "United States"}
        .compactMap {
            Country(id: $0,name: Locale.current.localizedString(forRegionCode: $0) ?? $0, phoneCode: $0)}
    return [Country(id: "US",name: Locale.current.localizedString(forRegionCode: "US") ?? "United States", phoneCode: "+91")] + locales
}
