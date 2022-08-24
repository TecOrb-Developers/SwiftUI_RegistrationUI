//
//  otpDemo.swift
//  SwiftUIRegistration
//
//  Created by Apple on 24/08/22.
//

import SwiftUI

struct otpDemo: View {
    @StateObject var viewModel = ViewModel()
         @State var isFocused = false
    @Binding var receiveNumber:String  
         let textBoxWidth = UIScreen.main.bounds.width / 8
         let textBoxHeight = UIScreen.main.bounds.width / 8
         let spaceBetweenBoxes: CGFloat = 10
         let paddingOfBox: CGFloat = 1
         var textFieldOriginalWidth: CGFloat {
             (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
         }
         
         var body: some View {
                 
             VStack(alignment: .leading){
                 Text("Enter the OTP")
                     .fontWeight(.bold)
                     .padding()
                     .frame(width: 350, height: 40,alignment:.leading)
                     .font(.system(size: 30))
                 
                 Text("We have sent Otp To\(self.receiveNumber)")
                   //  .. .fontWeight(.semibold)
                     .font(.title2)
                     .padding()
                     .font(.system(size: 20))
                 
                         
                         HStack (spacing: spaceBetweenBoxes){
                             
                             otpText(text: viewModel.otp1)
                             otpText(text: viewModel.otp2)
                             otpText(text: viewModel.otp3)
                             otpText(text: viewModel.otp4)
                             otpText(text: viewModel.otp5)
                             otpText(text: viewModel.otp6)
                         }
                         
                         
                         TextField("", text: $viewModel.otpField)
                         .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                         .disabled(viewModel.isTextFieldDisabled)
                         .textContentType(.oneTimeCode)
                         .foregroundColor(.clear)
                         .accentColor(.clear)
                         .background(Color.clear)
                         .keyboardType(.numberPad)
                     }
             //}
         }
         
         private func otpText(text: String) -> some View {
             
             return Text(text)
                 .font(.title)
                 .frame(width: textBoxWidth, height: textBoxHeight)
                 .background(VStack{
                   Spacer()
                   RoundedRectangle(cornerRadius: 1)
                       .frame(height: 0.5)
                  })
                 .padding(paddingOfBox)
         }
}

struct otpDemo_Previews: PreviewProvider {
    
    @State static var receiveNumber:String = ""
    
    static var previews: some View {
        otpDemo(receiveNumber: $receiveNumber)
    }
}
