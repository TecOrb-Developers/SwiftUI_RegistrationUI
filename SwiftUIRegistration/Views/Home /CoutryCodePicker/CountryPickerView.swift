//
//  CountryPickerView.swift
//  SwiftUIRegistration
//
//  Created by Apple on 08/12/22.
//
import SwiftUI
import CountryPicker

struct CountryPickerView: View {
    @State var country: Country?
    @State private var showCountryPicker = false
    @State var MobileNum:String = ""
    var body: some View {
        
        VStack {
            
            //  HStack{
            RoundedRectangle(cornerRadius: 8.0)
                .fill(.clear)
                .overlay(HStack
                         {
                    Button {showCountryPicker = true}
                label: {
                    Text("92")
                    Text("\(country?.phoneCode ?? "")").foregroundColor(.red)
                   
                }
                .sheet(isPresented: $showCountryPicker) {
                    CountryPicker(country: $country)
                }
               // .padding()
                    TextField("Enter Number", text: $MobileNum).padding()
                .overlay(RoundedRectangle(cornerRadius: 8.0).stroke(.gray,lineWidth: 1))
                })
                .frame(width: 250,height: 70)
            
            
            // }
          
        }
    }
}

struct CountryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerView()
    }
}




struct CountryPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = CountryPickerViewController
    
    let countryPicker = CountryPickerViewController()
    @Binding var country: Country?
    
    func makeUIViewController(context: Context) -> CountryPickerViewController {
        countryPicker.selectedCountry = "TR"
        countryPicker.delegate = context.coordinator
        return countryPicker
    }
    
    func updateUIViewController(_ uiViewController: CountryPickerViewController, context: Context) {
        //
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, CountryPickerDelegate {
        var parent: CountryPicker
        init(_ parent: CountryPicker) {
            self.parent = parent
        }
        func countryPicker(didSelect country: Country) {
            parent.country = country
        }
    }
}