//
//  ViewController.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/29.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var recheckPassword: UITextField!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var idCheckLabel: UILabel!
    @IBOutlet weak var passwordCheckLabel: UILabel!
    @IBOutlet weak var passwordReCheckLabel: UILabel!
    @IBOutlet weak var userNameCheckLabel: UILabel!
    
    @IBOutlet weak var nextButton: UIButton!
    private lazy var idDelegate = IDTextFieldDelegate(nextTextField: password, label: idCheckLabel)
    private lazy var pwDelegate = PWTextFieldDelegate(nextTextField: recheckPassword, label: passwordCheckLabel)
    private lazy var recheckPwDelegate = RecheckPWTextFieldDelegate(nextTextField: userName, prevTextField: password, label: passwordReCheckLabel)
    private lazy var nameDelegate = NamePWTextFieldDelegate(label: userNameCheckLabel)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        password.isSecureTextEntry = true
        recheckPassword.isSecureTextEntry = true
        setDelegate()
    }
    
    private func setDelegate() {
        id.delegate = idDelegate
        password.delegate = pwDelegate
        recheckPassword.delegate = recheckPwDelegate
        userName.delegate = nameDelegate
    }
}
