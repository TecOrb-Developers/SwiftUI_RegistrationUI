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
    @State var optionpicker:[String] = ["Always","Some Times","Any times"]
    var body: some View {
     
        Form{
             Section(header: Text("User Information"))
              {
                 TextField("Name",text: $name)
                    
                 TextField("Phone Number",text: $phoneNumber)
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
                      
                      //Picker(selection: $inde, content: <#T##() -> _#>, label: <#T##() -> _#>)
                  }
        
    }
        .navigationBarTitle("Settings")
 }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
