//
//  PWTextFieldDelegate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class PWTextFieldDelegate: NSObject, UITextFieldDelegate {
    private let nextTextField: UITextField
    private let label: UILabel
    private let inspector = InspectPassword()
    
    init(nextTextField: UITextField, label: UILabel) {
        self.nextTextField = nextTextField
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
        
        let state = inspect(with: inspector, password: textField.text ?? "")
        
        if state == InspectPassword.PasswordMessage.Success {
            textField.layer.borderColor = UIColor.green.cgColor
            self.label.textColor = .green
        } else {
            textField.layer.borderColor = UIColor.red.cgColor
            self.label.textColor = .red
        }
        self.label.text = state?.rawValue
    }
    
    private func inspect(with inspector: Inspectable, password: String) -> InspectPassword.PasswordMessage?{
        guard let message = inspector.inspect?(with: password) as? InspectPassword.PasswordMessage else {
            return nil
        }
        return message
    }
}
