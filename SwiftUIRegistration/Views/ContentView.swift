//
//  ContentView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 24/08/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dismiss) private var dismiss
    @State var name = ""
    @State var username:String = ""
    @ObservedObject private var user : User = User()
    @State private var isShowingDetailView = false
    @State var mobile = ""
    var body: some View {
        
        NavigationView
        {
            
            ZStack{
                
                NavigationLink(destination: SwiftUIView3())
                {
                    Image("Tutorial_Screen_first")
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .padding(.bottom,20)
                    //
                }
                
            }
            
            
        }
        //
        .navigationBarBackButtonHidden(true) // Hide default button
        .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
//struct loginPage:View
//{
//    @State var username:String = ""
//    var body: some View
//    {
//        VStack(alignment: .leading, spacing: 10)
//        {
//            Text("Login")
//                .bold()
//            padding()
//            Text("Please")
//                .fontWeight(.semibold)
//            HStack{
//                VStack(alignment: .leading, spacing: 10){
//                    Text("UserName")
//                    Text("Password")
//                   }
//                VStack{
//                    TextField("Type Some Thing", text: $username)
//
//                    TextField("Type Some Thing", text: $username)
//                }
//                .padding()
//            }
//
//        }.padding()
//    }
//}
