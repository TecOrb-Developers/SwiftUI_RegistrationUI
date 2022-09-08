//
//  ProfileView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 27/08/22.
//

import SwiftUI

struct ProfileView: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var Mobile:String = ""
    @State var Email:String = ""
    @State var DOB:String = ""
    @State var isShown:Bool = false
    @State var showActionSheet:Bool = false
    var gender = ["Male,Female"]
    @State var selectedIndex = 0
    @State var date = Date()
    @State private var selection = ""
       let colors = [" Gender ",",Red", "Green", "Blue", "Black", "Tartan"]
    @State var selectedIndexDrop = ""

    @ObservedObject var user:User = User()
   
    @Binding var FirstName:String
    @Binding var MobileNo1:String
  
    
    var body: some View {
       
        VStack{
            Button(action:
                    {
                self.showActionSheet.toggle()
                 })
              {
                RoundedRectangle(cornerRadius: 30)
                       .frame(width: 38, height: 38, alignment: .center)
                       .foregroundColor(Color.white)
                       .overlay(
                              RoundedRectangle(cornerRadius: 30))
                       .frame(width: 36, height: 36, alignment: .center)
                       .foregroundColor(Color.init(red: 232/255, green: 233/255, blue: 231/255))
                       .overlay(
                           Image("image_profile")
                    )
                }
              .frame(width: 100, height: 100)
              .background(.gray)
              .cornerRadius(10)
              .padding(.top,0)
          
            if FirstName == ""
            {
                TextField("First Name",text: $user.name )
                    .padding()
            }
            else{
                TextField("First Name",text: self.$FirstName )
                    .padding()
                let _ = print("......\(FirstName)......")
                
            }
            
            TextField("Last Name",text: $lastName)
                .padding()
            
              if MobileNo1 == ""
              {
                  TextField("Mobile No",text: $Mobile)
                      .padding()
              }
              else{
                  TextField("Mobile No",text: self.$MobileNo1 )
                      .padding()
                  let _ = print("......\(MobileNo1)......")
                 
              }
            
            TextField("Email",text: $Email)
                .padding()
            
            HStack{
             
    // MARK: To Show Date picker
                DatePicker("Select Date",selection: $date,in:Date()...,displayedComponents: .date)
                    
            }
            .padding()
    // MARK: To Drop down
            HStack{
                Button(action: {
                   
                })
                {
                     Picker("Select a paint color", selection: $selection) {
                            ForEach(colors, id: \.self) { index in
                             
                                Text( index )
                                   
                               }
                           }
                     .pickerStyle(.automatic)
                        .frame(width: 100, height: 40)
                        .padding()
                            Spacer()
                            Image("reg_dropdown-1")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .padding()
                    }
                
            }
            NavigationLink(destination: SideMenuView(userName: $firstName, mobileNumber: $Mobile))
            {
            Text("Submit")
                .font(.headline)
                .frame(width: 250, height: 45)
                .background(.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .shadow(color: .black, radius: 10)
                .opacity(0.8)
            }
    // MARK: To Show Image Gallery Pickup
                          .actionSheet(isPresented: $showActionSheet, content: {()->ActionSheet in
                              ActionSheet(title: Text("Select image"), message: Text("Please select an image from the gallary or use Camera"), buttons: [ActionSheet.Button.default(Text("Camera"),action: {
                                 
                              }),
                              ActionSheet.Button.default(Text("Photo Gallery"),action:{
                                  self.isShown.toggle()
                              }),
                              ActionSheet.Button.cancel()
                            ])
                    })
          }
        
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
       
    }
   
}

struct ProfileView_Previews: PreviewProvider {
    @State static var firstName = ""
    @State static var Mobile = ""
    
    static var previews: some View {
       
        ProfileView( FirstName: $firstName, MobileNo1: $Mobile)
    }
}

struct SelectUserName: View {
    
    @Binding var FirstName:String
    
    var body: some View {
        TextField("Name", text: self.$FirstName)
    }
}
