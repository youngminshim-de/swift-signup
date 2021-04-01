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
    private lazy var idDelegate = IDTextFieldDelegate(nextTextField: password)
    private lazy var pwDelegate = PWTextFieldDelegate(nextTextField: recheckPassword)
    private lazy var recheckPwDelegate = RecheckPWTextFieldDelegate(nextTextField: userName, prevTextField: password)
    private lazy var nameDelegate = NamePWTextFieldDelegate()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setDelegate()
        setObserver()
    }
    
    func setDelegate() {
        id.delegate = idDelegate
        password.delegate = pwDelegate
        recheckPassword.delegate = recheckPwDelegate
        userName.delegate = nameDelegate
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changePWLabel),
                                               name: NotificationName.password,
                                               object: CheckSignUpForm.shared)
        NotificationCenter.default.addObserver(self, selector: #selector(changeIDLabel),
                                               name: NotificationName.id,
                                               object: CheckSignUpForm.shared)
        NotificationCenter.default.addObserver(self, selector: #selector(changeRecheckPWLabel),
                                               name: NotificationName.password,
                                               object: CheckSignUpForm.shared)
    }
    
    @objc func changePWLabel(_ notificaion: Notification) {
        if let message = notificaion.userInfo as? [CheckSignUpForm.PasswordMessage : String] {
            for (key, text) in message {
                if key == CheckSignUpForm.PasswordMessage.Success {
                    passwordCheckLabel.textColor = .green
                } else {
                    passwordCheckLabel.textColor = .red
                }
                passwordCheckLabel.text = text
            }
        }
    }
    
    @objc func changeIDLabel(_ notification: Notification) {
        if let message = notification.userInfo as? [CheckSignUpForm.IDMessage : String] {
            for (key, text) in message {
                if key == CheckSignUpForm.IDMessage.Success {
                    idCheckLabel.textColor = .green
                } else {
                    idCheckLabel.textColor = .red
                }
                idCheckLabel.text = text
            }
        }
    }
    
    @objc func changeRecheckPWLabel(_ notification: Notification) {
        if let message = notification.userInfo as? [CheckSignUpForm.PasswordRecheckMessage : String] {
            for (key, text) in message {
                if key == CheckSignUpForm.PasswordRecheckMessage.Same {
                    passwordReCheckLabel.textColor = .green
                } else {
                    passwordReCheckLabel.textColor = .red
                }
                passwordReCheckLabel.text = text
            }
        }
    }
}
