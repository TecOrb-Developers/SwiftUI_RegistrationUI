//
//  CameraButtonView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 26/08/22.
//

import SwiftUI

struct CameraButtonView: View {
    @State var showActionSheet:Bool
    var body: some View {
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
   
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CameraButtonView(showActionSheet: false)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
