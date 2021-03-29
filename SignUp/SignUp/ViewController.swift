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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        id.addTarget(self, action: #selector(didEndExit(_:)), for: UIControl.Event.editingDidEndOnExit)
        password.addTarget(self, action: #selector(didEndExit(_:)), for: UIControl.Event.editingDidEndOnExit)
        recheckPassword.addTarget(self, action: #selector(didEndExit(_:)), for: UIControl.Event.editingDidEndOnExit)
        userName.addTarget(self, action: #selector(didEndExit(_:)), for: UIControl.Event.editingDidEndOnExit)
    }
    @objc func didEndExit(_ sender: UITextField) {
        if password.isFirstResponder {
            userName.becomeFirstResponder()
        }
    }
}

