//
//  SideMenuView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 25/08/22.
//

import SwiftUI

struct SideMenuView: View {
    @Binding var userName:String
    @Binding var mobileNumber:String
    var body: some View {
        
        VStack{
            VStack(alignment: .leading){
                NavigationLink(destination: HomeView(userName: $userName, mobileNumber: $mobileNumber))
                {
                    Image("sidemenu_cross_icon-1")
                        .frame(width: 30, height: 30)
                        .padding(.top,30)
                    
                }
                .padding(.leading, -160)
                .padding(.top,-30)
// MARK: To Show username And Mobile
                VStack{
                let user = userName == "" ? "Om Singh" : "\(userName)"
                    let mobile = mobileNumber == "" ? "9090909090": "\(mobileNumber)"
                    
                    Text("Hii \(user)")
                        .padding(.leading, -180)
                        .padding(.top,10)
                        .font(.headline)
                       
                    Text("\(mobile)")
                        .padding(.leading, -180)
                        .padding()
                        .padding(.top,-20)
                }
               
              
            }
            .padding(.leading,20)
            .padding(.top,-10)
 // MARK: To Show Border
             Text("")
                .frame(width: 480, height: 15)
                .background(.gray)
                .padding(.top)
  // MARK: To Show Table List
            List
            {
                HStack(spacing: 5){
                    Image("my_trip_bus")
                    Text(" My Trip")
                }
                .padding(.leading,10)
                
                HStack(spacing: 5){
                    Image("sidemenu_my_rides-1")
                    Text(" My Rides")
                }
                .padding(.leading,10)
                
                HStack(spacing: 5){
                    Image("sidemenu_help")
                    Text(" Help")
                }
                .padding(.leading,10)
                
                HStack(spacing: 5){
                    Image("sidemenu_notification-1")
                    Text(" Notificatios")
                }
                .padding(.leading,10)
                
                HStack(spacing: 5){
                    NavigationLink(destination: SettingView())
                    {
                    Image("sidemenu_settings-1")
                    Text(" Settings")
                    }
                }
                .padding(.leading,10)
                
                HStack(spacing: 5){
                    NavigationLink(destination: SwiftUIView5())
                    {
                        Image("sidemenu_signout")
                        Text(" SignOut")
                        
                    }
                   
                }
                .padding(.leading,10)
            }
// MARK: To Move left right Table List
            .padding(.leading, -20)
            .padding(.top, -20)
            .padding(.trailing, -20)
            .padding(.bottom, 230)
        }
// MARK: full Screeen VStack
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
        .padding(.top, -10)
        .navigationBarBackButtonHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    @State static var userName:String = ""
    @State static var mobileNumber:String = ""
    
    static var previews: some View {
        SideMenuView(userName: $userName, mobileNumber: $mobileNumber)
    }
}
