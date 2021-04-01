//
//  NameTextFieldDelegate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class NamePWTextFieldDelegate: NSObject, UITextFieldDelegate {
    private let label: UILabel
    
    init(label: UILabel) {
        self.label = label
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
       
        let state = CheckSignUpForm.shared.inspectUserName(with: textField.text!)
        if state == CheckSignUpForm.UserNameMessage.Empty {
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            textField.layer.borderColor = UIColor.green.cgColor
        }
        self.label.text = state.rawValue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        
        let state = CheckSignUpForm.shared.inspectUserName(with: textField.text!)
        
        if state == CheckSignUpForm.UserNameMessage.Empty {
            textField.layer.borderColor = UIColor.red.cgColor
            self.label.textColor = .red
        } else {
            textField.layer.borderColor = UIColor.green.cgColor
            self.label.textColor = .green
        }
        self.label.text = state.rawValue
    }
}
