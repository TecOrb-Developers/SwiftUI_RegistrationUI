//
//  BackButton.swift
//  SwiftUi Practice
//
//  Created by Apple on 24/08/22.
//

import Foundation
import SwiftUI


import Foundation
import SwiftUI

struct NavBackButton: View {
  
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
