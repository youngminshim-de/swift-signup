//
//  SignUpTextField.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class IDTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.becomeFirstResponder()
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

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        textField.layer.borderWidth = 1
        if CheckSignUpForm.shared.inspectID(with: textField.text!) {
            textField.layer.borderColor = UIColor.green.cgColor
            
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
        }

        return true
    }
}
