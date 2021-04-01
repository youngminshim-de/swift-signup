//
//  RecheckPWTextFieldDelegate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class RecheckPWTextFieldDelegate: NSObject, UITextFieldDelegate {
    private let nextTextField: UITextField
    private let prevTextField: UITextField
    
    init(nextTextField: UITextField, prevTextField: UITextField) {
        self.nextTextField = nextTextField
        self.prevTextField = prevTextField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nextTextField.becomeFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        if CheckSignUpForm.shared.reInspectPassword(with: prevTextField.text!, with: textField.text!) {
            textField.layer.borderColor = UIColor.green.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        
//        textField.layer.borderWidth = 1
//        if CheckSignUpForm.shared.reInspectPassword(with: prevTextField.text!, with: textField.text!) {
//            textField.layer.borderColor = UIColor.green.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.red.cgColor
//        }
//        return true
//    }
}
