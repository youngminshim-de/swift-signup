//
//  Validate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

@objc protocol Inspectable {
    @objc optional func inspect(with item: String) -> Any
    @objc optional func inspect(with item: String, with item2: String) -> Any
}

class InspectID: Inspectable {

    enum IDMessage: String {
        case Range = "5자이상 20자 이하로 입력해주세요"
        case Used = "이미 사용중인 아이디입니다"
        case Success = "사용 가능한 아이디입니다"
    }
    
    private var idList: [String] = []
    
    init() {
        NetworkManager().serialization() { (list) in
            self.idList = list
        }
    }
    
    func inspect(with item: String) -> Any{
        let temp = NSPredicate(format: "SELF MATCHES %@", "[a-z0-9-_]{5,20}")
        
        if !temp.evaluate(with: item) {
            return IDMessage.Range
        }
        else if idList.contains(item){
            return IDMessage.Used
        } else {
            return IDMessage.Success
        }
    }
}

class InspectPassword: Inspectable {
    
    enum PasswordMessage: String {
        case Range = "8자 이상 16자 이하로 입력해주세요"
        case UpperCase = "영문 대문자를 최소 1자이상 포함해주세요"
        case Number = "숫자를 최소 1자 이상 포함해주세요"
        case Character = "특수문자를 최소 1자 이상 포함해주세요"
        case Success = "안전한 비밀번호입니다"
    }
    
    func inspect(with item: String) -> Any {
        if let message = passwordRange(item) {
            return message
        }
        
        if let message = passwordUpperCase(item) {
            return message
        }
        
        if let message = passwordNumber(item) {
            return message
        }
        
        if let message = passwordSymbol(item) {
            return message
        }
        return PasswordMessage.Success
    }
    
    private func passwordUpperCase(_ password: String) -> PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[A-Z])")
        
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.UpperCase
    }
    
    private func passwordNumber(_ password: String) -> PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[0-9])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.Number
    }

    private func passwordSymbol(_ password: String) -> PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[$@$!%*?&])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.Character
    }
    
    private func passwordRange(_ password: String) -> PasswordMessage? {
        if password.count < 8 || password.count > 16 {
            return PasswordMessage.Range
        }
        return nil
    }
}

class InspectUserName: Inspectable {
    
    enum UserNameMessage: String {
        case Empty = "이름은 필수 입력 항목입니다"
        case Success = ""
    }
    
    func inspect(with name: String) -> Any {
        if name.isEmpty {
            return UserNameMessage.Empty
        }
        else {
            return UserNameMessage.Success
        }
    }
}

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
