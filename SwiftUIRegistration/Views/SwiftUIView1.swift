//
//  SwiftUIView1.swift
//  SwiftUi Practice
//
//  Created by Apple on 09/08/22.
//

import SwiftUI

struct SwiftUIView1: View {
    @State private var isShowingDetailView = false
    var body: some View {
        Image("logo")
            .clipShape(Circle())
    }
}

struct SwiftUIView1_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView1()
    }
}
