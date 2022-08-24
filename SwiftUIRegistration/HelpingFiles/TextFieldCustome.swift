//
//  TextFieldCustome.swift
//  SwiftUi Practice
//
//  Created by Apple on 24/08/22.
//

import Foundation
import SwiftUI
struct CustomLabelTextfield :View
{
    var label :String
    var placeHolder: String
    var secure :Bool
    @Binding var bVariable :String
    var body: some View
    {
        VStack(alignment: .leading){
            Text(label)
                .font(.headline)
            if secure
            {
                SecureField(placeHolder,text: $bVariable)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
            else{
                TextField(placeHolder,text: $bVariable)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal,20)
      //  .padding([.bottom,.top],10)
    }
}
