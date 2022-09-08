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

struct NavBackButton:View {
    @State var text = ""
   // @State var color:Color?
   // var nextImage: targetImage
    let dismiss: DismissAction
    
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("back_arrow_black")
                
            Text("\(text)")
            foregroundColor(Color.red)
        }
    }
}
//struct NavBackButton<targetImage:View>:View {
//    @State var text = ""
//   // @State var color:Color?
//    var nextImage: targetImage
//    let dismiss: DismissAction
//
//    var body: some View {
//        Button {
//            dismiss()
//        } label: {
//            Image("\(nextImage)")
//
//            Text("\(text)")
//
//        }
//    }
//}
