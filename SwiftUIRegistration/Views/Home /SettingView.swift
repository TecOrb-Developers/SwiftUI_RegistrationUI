//
//  SettingView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 25/08/22.
//

import SwiftUI

struct SettingView: View {
    @State var name = ""
    @State var phoneNumber = ""
    @State var isActive = false
    @State var isActiveNotification = false
    @State private var previewIndex = 0
    @State var Name = ""
    
    @Binding var userName:String
    @Binding var userNumber:String
   var previousOption:[String] = ["Always","When Unlocked","Never"]
    var body: some View {
       
        
        Form{
    //let Namee = self.userName == "" ? "\($name)":"\(userName)"
         //   self.Name = Namee
             Section(header: Text("User Information"))
              {
                 
                  TextField("Name", text: $userName,
                            onEditingChanged:  { (isBegin) in
                             if isBegin {
                                 print("\(userName)")
                             } else {
                                 print("Finishes editing")
                             }
                         }
                  )
                  
                  TextField("Phone Number",text: $userNumber,
                            
                    onEditingChanged: { (isBegin) in
                     if isBegin {
                         print("\(userNumber)")
                     } else {
                         print("Finishes editing")
                     }
                 }
            )
                 Toggle(isOn: $isActive)
                 {
                  Text("Account is Active")
                }
              }
           Section(header: Text("Notifications"))
                  {
                     Toggle(isOn: $isActiveNotification)
                      {
                        Text("Enabled")
                      }
                      
                  Picker(selection: $previewIndex, label: Text("General"))
                      {
                          ForEach(0..<previousOption.count)
                          {
                              Text(self.previousOption[$0])
                          }
                      }
                  }
           Section(header: Text("About"))
            {
                HStack{
                    Text("Version")
                    Spacer()
                    Text("1.0.1")
                }
            }
            Section(header: Text("Reset Date"))
            {
                Button(action:
                        {
                    print("Action executed")
                })
                {
                    Text("Reset All Cache")
                }
            }
        
    }
        .navigationBarTitle("Settings")
 }
}

struct SettingView_Previews: PreviewProvider {
    @State static var userName:String = ""
    @State static var userNumber:String = ""
    static var previews: some View {
        SettingView(userName: $userName, userNumber: $userNumber)
    }
}
