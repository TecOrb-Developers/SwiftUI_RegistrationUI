//
//  CountryCode.swift
//  SwiftUIRegistration
//
//  Created by Apple on 08/09/22.
//

import SwiftUI

struct CountryCode: View {
    @State var phoneNumber = ""
     @State var code = ""
     @ObservedObject var codeTextField = ObservableTextField()
    var body: some View {
        ZStack {
                   RoundedRectangle(cornerRadius: 10).stroke()
                       .frame(width: 270, height: 50)
                   HStack (spacing: 0) {
                       
                       HStack (spacing: 0) {
                           Text("\(flag(country: getCountryCode(codeTextField.value)))")
                               .frame(width: 30, height: 50)
                           
                           TextField("+1", text: $codeTextField.value)
                               .keyboardType(.phonePad)
                               .frame(width: 40, height: 50)
                       }
                       .background(Color.secondary.opacity(0.2))
                       .cornerRadius(10)
                       
                       TextField("Phone Number", text: $phoneNumber)
                           .padding()
                           .frame(width: 200, height: 50)
                           .keyboardType(.phonePad)
                       
                   }.padding()
               }
    }
   
}

struct CountryCode_Previews: PreviewProvider {
    static var previews: some View {
        CountryCode()
    }
}
