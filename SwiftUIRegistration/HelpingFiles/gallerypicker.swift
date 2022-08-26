//
//  gallerypicker.swift
//  SwiftUIRegistration
//
//  Created by Apple on 26/08/22.
//

import Foundation
import SwiftUI
struct ImagePicker:UIViewControllerRepresentable
{
   
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = true
       // vc.sourceType = .camera
        vc.sourceType = .photoLibrary
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
      
        }
    }

