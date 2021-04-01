//
//  PWTextFieldDelegate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class PWTextFieldDelegate: NSObject, UITextFieldDelegate {
    private let nextTextField: UITextField
    
    init(nextTextField: UITextField) {
        self.nextTextField = nextTextField
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
        
        if CheckSignUpForm.shared.inspectPassword(with: textField.text!) {
            textField.layer.borderColor = UIColor.green.cgColor
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }
        
    }

//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        textField.layer.borderWidth = 1
//
//        if CheckSignUpForm.shared.inspectPassword(with: textField.text!) {
//            textField.layer.borderColor = UIColor.green.cgColor
//        } else {
//            textField.layer.borderColor = UIColor.red.cgColor
//        }
//        return true
//    }
}
