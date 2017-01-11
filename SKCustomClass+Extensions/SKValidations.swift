//
//  SKValidations.swift
//  SK_CustomClass+Extensions
//
//  Created by steve jobs on 11/01/17.
//  Copyright © 2017 samKolhe. All rights reserved.
//

import UIKit

class SKValidations: NSObject {

   //CHECK EMAIL IS VALID OR NOT AND ALSO SET PLACEHOLDER MESSAGE IF WANT SHOWALERT WITH RESPECTED TEXTFIELD PLACEHOLDER MESSAGE
    func Email(_ textField: UITextField, showAlert: Bool) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        textField.placeHolderColor = UIColor.darkGray
        textField.placeholder = (textField.placeholder)?.replacingOccurrences(of: "Enter Valid ", with: "")
        textField.placeholder = (textField.placeholder)?.replacingOccurrences(of: "Valid", with: "")
        //textField.placeholder = (textField.placeholder)?.stringByReplacingOccurrencesOfString(" ", withString: "")
        if(!emailTest.evaluate(with: textField.text!))
        {
            //IF YOU WANT TO SHOW ALERT WHEN EMAIL IS NOT VALID
            if(showAlert)
            {
                textField.text = ""
                textField.placeholder = "Enter Valid "+textField.placeholder!
                textField.placeHolderColor = UIColor.red
            }
            textField.becomeFirstResponder()
            return false
        }
        return emailTest.evaluate(with: textField.text!)
    }
    
    
    //CHECK EMAIL IS VALID OR NOT AND ALSO SET PLACEHOLDER MESSAGE IF WANT SHOWALERT WITH RESPECTED TEXTFIELD PLACEHOLDER MESSAGE ON TOOLTIP MESSAGE
    func EmailWithToolTipAlert(_ textField: UITextField) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if(!emailTest.evaluate(with: textField.text!))
        {
            var preferences = EasyTipView.Preferences()
            preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
            preferences.drawing.foregroundColor = UIColor.white
            preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
            preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
            EasyTipView.show(forView: textField,
                             withinSuperview: UINavigationController().navigationController?.view,
                             text: "Enter valid \(textField.placeholder)",
                preferences: preferences,
                delegate: nil)
            return false
        }
        return emailTest.evaluate(with: textField.text!)
    }
    
    
    //CHECK TEXTFIELD IS EMPTY OR NOT WITH RESPECTED TEXTFEILD PLACEHOLDER MESSAGE.
    func ValidTextfield(_ textfields :[UITextField], showAlert: Bool) -> Bool
    {
        for textField in textfields
        {
            textField.placeHolderColor = UIColor.darkGray
            textField.placeholder = (textField.placeholder)?.replacingOccurrences(of: "Enter ", with: "")
            let str : CharacterSet = CharacterSet(charactersIn: " ")
            if( textField.text!.trimmingCharacters(in: str) == "")
            {
                //IF YOU WANT TO SHOW ALERT WHEN TEXTFIELD HAVING NO ANY TEXT
                if(showAlert)
                {
                    textField.placeholder = "Enter "+textField.placeholder!
                    textField.placeHolderColor = UIColor.red
                }
                textField.becomeFirstResponder()
                return false
            }
        }
        
        return true
    }
    
    
    //CHECK TEXTFIELD IS EMPTY OR NOT WITH RESPECTED TEXTFEILD PLACEHOLDER MESSAGE ON TOOLTIP VIEW.
    func ValidTextfieldWithToolTipAlert(_ textfields :[UITextField]) -> Bool
    {
        for textField in textfields
        {
            let str : CharacterSet = CharacterSet(charactersIn: " ")
            if( textField.text!.trimmingCharacters(in: str) == "")
            {
                var preferences = EasyTipView.Preferences()
                preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
                preferences.drawing.foregroundColor = UIColor.white
                preferences.drawing.backgroundColor = UIColor(hue:0.46, saturation:0.99, brightness:0.6, alpha:1)
                preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.top
                EasyTipView.show(forView: textField,
                                 withinSuperview: UINavigationController().navigationController?.view,
                                 text: "Enter \(textField.placeholder)",
                    preferences: preferences,
                    delegate: nil)
                
                return false
            }
        }
        
        return true
    }
    
    //CHECK IS PHONE NUMBER OR NOT
    func isPhoneNumber(_ value: String) -> Bool {
        
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        
        let result =  phoneTest.evaluate(with: value)
        
        return result
        
    }
    
    //CHECK MOBILE NUMBER IS VALID OR NOT
    func PhoneNumber(_ textField: UITextField, showAlert: Bool) -> Bool {
        
        var filtered:String!
        let charcter  = CharacterSet(charactersIn: "+0123456789").inverted
        let inputString:Array = textField.text!.components(separatedBy: charcter)
        
        filtered = inputString.joined(separator: "") as String!
        let isNumber =  textField.text! == filtered
        
        textField.placeHolderColor = UIColor.darkGray
        textField.placeholder = (textField.placeholder)?.replacingOccurrences(of: "Enter Valid ", with: "")
        textField.placeholder = (textField.placeholder)?.replacingOccurrences(of: "Valid", with: "")
        
        //CHECK NUMBER COUNT IS IN BETWEEN 10 TO 15
        let charCount = (textField.text!).characters.count > 15 || (textField.text!).characters.count < 10
        if((isNumber && charCount) || !isNumber)
        {
            //IF YOU WANT TO SHOW ALERT WHEN NUMBER NOT VALID
            if(showAlert)
            {
                textField.text = ""
                textField.placeholder = "Enter Valid "+textField.placeholder!
                textField.placeHolderColor = UIColor.red
            }
            textField.becomeFirstResponder()
            return false
        }

        return isNumber
        
    }

}
