//
//  Validation.swift
//  SwiftUi Practice
//
//  Created by Apple on 24/08/22.
//
import Foundation
import SwiftUI
extension String
    {
        // To Check Whether Email is valid
        func isEmail() -> Bool {
            let emailRegex = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,4})$" as String
            let emailText = NSPredicate(format: "SELF MATCHES %@",emailRegex)
            let isValid  = emailText.evaluate(with: self) as Bool
            return isValid
        }
        
        var isValidURL: Bool {
            // "www.google.com"
                guard !contains("..") else { return false }
                let head     = "((http|https)://)?([(w|W)]{3}+\\.)?"
                let tail     = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
                let urlRegEx = head+"+(.)+"+tail
                let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
                return urlTest.evaluate(with: trimmingCharacters(in: .whitespaces))
            }
        
        func isValidUserName() -> Bool{
            let passwordRegix = "^[A-Za-z ]*$"
             let passwordText  = NSPredicate(format:"SELF MATCHES %@",passwordRegix)
             return passwordText.evaluate(with:self)
        }
        
        func isBackSpace()->Bool {
            if let char = self.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
                return isBackSpace == -92
            }
            return true
        }
        
        // To Check Whether Email is valid
        func isValidString() -> Bool {
            if self == "<null>" || self == "(null)" {
                return false
            }
            return true
        }
        
        func isValidPassword() -> Bool {
            // least one uppercase,
            // least one digit
            // least one lowercase
            // least one symbol
            //  min 8 characters total
            let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
            let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,15}$"
            let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
            return passwordCheck.evaluate(with: password)

        }
        
        // To Check Whether Phone Number is valid
        
        func isPhoneNumber() -> Bool {
            if self.isStringEmpty() {
                return false
            }
            let phoneRegex = "^\\d{6,12}$"
            let phoneText = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            let isValid = phoneText.evaluate(with: self) as Bool
            return isValid
        }
        
        func isNumber() -> Bool {
            if self.isStringEmpty() {
                return false
            }
            let phoneRegex = "^\\d{1,15}$"
            let phoneText = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            let isValid = phoneText.evaluate(with: self) as Bool
            return isValid
        }
        
        func isNumberContains() -> Bool {
            if self.isStringEmpty() {
                return false
            }
            let phoneRegex = "^\\d{0,30}$"
            let phoneText = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            let isValid = phoneText.evaluate(with: self) as Bool
            return isValid
            //return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
            
        }
        // Password_Validation
        func isPasswordValidate() -> Bool {
            //  let passwordRegix = "[A-Za-z0-9.@#$%*?:!+-/]{8,15}"
              let passwordRegix = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,15}$"
              let passwordText  = NSPredicate(format:"SELF MATCHES %@",passwordRegix)
              
              return passwordText.evaluate(with:self)
          
        }
        func isSpecialCharactersExcluded()->Bool{
            let regex = "^[^<>'\"/;`%]*$"
            let regexText  = NSPredicate(format:"SELF MATCHES %@",regex)
            return regexText.evaluate(with:self)
        }
        
        // To Check Whether URL is valid
        func isURL() -> Bool {
            let urlRegex = "(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+" as String
            let urlText = NSPredicate(format: "SELF MATCHES %@", urlRegex)
            let isValid = urlText.evaluate(with: self) as Bool
            return isValid
        }
        
        // To Check Whether Image URL is valid
        
        func isImageURL() -> Bool {
            if self.isURL() {
                if self.range(of: ".png") != nil || self.range(of: ".jpg") != nil || self.range(of: ".jpeg") != nil {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        
        func toInt() -> Int
        {
            return Int(self) ?? 0
        }
        
        func trimAll()->String
        {
            return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
        static func getString(_ message: Any?) -> String {
            guard let strMessage = message as? String else {
                guard let doubleValue = message as? Double else {
                    guard let intValue = message as? Int else {
                        guard let int64Value = message as? Int64 else{
                            return ""
                        }
                        return String(int64Value)
                    }
                    return String(intValue)
                }
                let formatter = NumberFormatter()
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 20
                formatter.minimumIntegerDigits = 1
                guard let formattedNumber = formatter.string(from: NSNumber(value: doubleValue)) else {
                    return ""
                }
                return formattedNumber
            }
            return strMessage.stringByTrimmingWhiteSpaceAndNewLine()
        }
        
        static func getLength(_ message: Any?) -> Int {
            return String.getString(message).stringByTrimmingWhiteSpaceAndNewLine().count
        }
        
        static func checkForValidNumericString(_ message: AnyObject?) -> Bool {
            guard let strMessage = message as? String else {
                return true
            }
            
            if strMessage == "" || strMessage == "0" {
                return true
            }
            return false
        }
        
        
        // To Check Whether String is empty
        
        func isStringEmpty() -> Bool {
            return self.stringByTrimmingWhiteSpace().count == 0 ? true : false
        }
        
        mutating func removeSubString(subString: String) -> String {
            if self.contains(subString) {
                guard let stringRange = self.range(of: subString) else { return self }
                return self.replacingCharacters(in: stringRange, with: "")
            }
            return self
        }
        
        // Get string by removing White Space & New Line
        
        func stringByTrimmingWhiteSpaceAndNewLine() -> String {
            return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
        }
        
        // Get string by removing White Space
        
        func stringByTrimmingWhiteSpace() -> String {
            return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
        }
        
        func getSubStringFrom(begin: NSInteger, to end: NSInteger) -> String {
            // var strRange = begin..<end
            // let str = self.substringWithRange(strRange)
            return ""
        }
    }
