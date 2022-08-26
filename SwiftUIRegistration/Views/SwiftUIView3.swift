//
//  SwiftUIView3.swift
//  SwiftUi Practice
//
//  Created by Apple on 10/08/22.
//

import SwiftUI

struct SwiftUIView3: View {
    @Environment(\.dismiss) private var dismiss
    @State var isModal = false
    @State var nameArr = ["Singh","Kumar","Chaurasiya","Shrama","katiyar","Kumar","Chaurasiya","Shrama","katiyar"]
    var body: some View {
        //        NavigationView
        //        {
        ScrollView
        {
            NavigationLink("click here ",destination: LanguageSelectView())
                .padding([.leading, .trailing], 30)
                .padding([.top], 10)
                .frame(height: 50)
            
            VStack{
                ForEach(nameArr.indices){ index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        
                        HStack{
                            ForEach(nameArr.indices){ index  in
                                Rectangle()
                                    .frame(width: 350, height: 200,alignment: Alignment.leading)
                                    .background(.blue)
                                    .cornerRadius(25)
                                    .shadow(color: .black, radius: 1)
                                    .opacity(0.5)
                               /// VStack(alignment: .leading){
                             .overlay(Text("\(nameArr[index])"))
                                        .foregroundColor(Color.white)
                                        .padding(.leading,10)
                                
                                //}
                                   
                                    
                                 
                                   
                                   
                                   
                                    //.cornerRadius(25)
                                    
                                   
                               
                                  //  .padding()
                                //
                            }
                        }
                    })
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true) // Hide default button
        .navigationBarItems(leading: NavBackButton(dismiss: self.dismiss))
        
    }
}



struct SwiftUIView3_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView3()
    }
}

