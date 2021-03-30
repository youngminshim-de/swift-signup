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
    
    private var textFieldDelegate = TextFieldDelegate()
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        id.delegate = textFieldDelegate
        password.delegate = textFieldDelegate
        recheckPassword.delegate = textFieldDelegate
        userName.delegate = textFieldDelegate
    }
}
