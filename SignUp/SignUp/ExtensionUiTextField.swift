//
//  ExtensionUiTextField.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/29.
//

import UIKit

@IBDesignable

class BorderTextField: UITextField {
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
}
