//
//  HomeView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 25/08/22.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var userName:String
    @Binding var mobileNumber:String
    var body: some View {
        VStack{
            Text("Welcome to Home Screen")
                .font(.title)
                .padding(.top,80)
            HStack{
                NavigationLink(destination: SideMenuView(userName: $userName, mobileNumber: $mobileNumber))
                {
                   
                    Image("sorting_icon")
                        .frame(width: 200, height: 40,alignment: .trailing)
                       .padding(30)
    
                }
               // .padding(10)
                let user = userName == "" ? "Om Singh":"\(userName)"
                Text(" Hello \(user) ")
                    .frame(width: 210, height: 40, alignment:.center)
                    .padding(10)
                  //  .font(.headline)
                   .font(.title2)
                    
            
                NavigationLink(destination: LanguageSelectView())
                {
                    
                    Image("home_botification_icon")
                        .frame(width: 200, height: 40,alignment: .leading)
                        .padding(30)
                }
            }
            .padding(.top,20)
            .padding([.leading,.trailing],-170)
            
            Text("Please turn on the Activity status to \n          receive the booking details")
                .font(.system(size: 20))
                .foregroundColor(Color.blue)
                .padding(.top,10)
                .padding(.bottom,30)
            Image("support_illustration")
                .frame(width: 0, height: 0)
                .padding(.top , 90)
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .top
            )
        .edgesIgnoringSafeArea(.all)
        
        .navigationBarBackButtonHidden(true) 
     
    }
}
struct HomeView_Previews: PreviewProvider {
    @State static var userName:String = ""
    @State static var mobileNumber:String = ""
    static var previews: some View {
        HomeView(userName: $userName, mobileNumber: $mobileNumber)
    }
}


struct BackButton: View {
  
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("back_icon_second")
                
            Text("Go Back")
                  .foregroundColor(Color.red)
        }
    }
}
