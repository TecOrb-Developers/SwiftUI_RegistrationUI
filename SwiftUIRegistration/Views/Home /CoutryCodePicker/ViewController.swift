//
//  ViewController.swift
//  SwiftUIRegistration
//
//  Created by Apple on 08/12/22.
//

import UIKit
import CountryPicker

class ViewController: UIViewController {

    @IBAction func pick() {
        startPicker()
    }

    private func startPicker() {
        let countryPicker = CountryPickerViewController()
        countryPicker.selectedCountry = "TR"
        countryPicker.delegate = self
        self.present(countryPicker, animated: true)
    }

}

extension ViewController: CountryPickerDelegate {
    func countryPicker(didSelect country: Country) {
        print(country.localizedName)
    }
}
