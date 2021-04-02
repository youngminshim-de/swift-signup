//
//  InspectRecheckPassword.swift
//  SignUp
//
//  Created by 심영민 on 2021/04/02.
//

import Foundation

class InspectRecheckPassword: Inspectable {
    
    enum PasswordRecheckMessage: String {
        case Same = "비밀번호가 일치합니다"
        case Different = "비밀번호가 일치하지 않습니다"
    }
    
    func inspect(with item: String, with item2: String) -> Any {
        if item == item2 {
            return PasswordRecheckMessage.Same
        } else {
            return PasswordRecheckMessage.Different
        }
    }
}
