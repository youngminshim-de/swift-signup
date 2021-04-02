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
    private let label: UILabel
    private let inspector = InspectRecheckPassword()
    
    init(nextTextField: UITextField, prevTextField: UITextField, label: UILabel) {
        self.nextTextField = nextTextField
        self.prevTextField = prevTextField
        self.label = label
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
        
        let state = inspect(with: inspector, password: textField.text ?? "", targetPassword: prevTextField.text ?? "")
        
        if  state == InspectRecheckPassword.PasswordRecheckMessage.Same {
            textField.layer.borderColor = UIColor.green.cgColor
            self.label.textColor = .green
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            self.label.textColor = .red
        }
        self.label.text = state?.rawValue
    }
    
    func inspect(with inspector: Inspectable, password: String, targetPassword: String) -> InspectRecheckPassword.PasswordRecheckMessage? {
        guard let message = inspector.inspect?(with: password, with: targetPassword) as? InspectRecheckPassword.PasswordRecheckMessage else {
            return nil
        }
        return message
    }
}
