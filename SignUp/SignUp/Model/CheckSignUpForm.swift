//
//  Validate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class CheckSignUpForm {
    static var shared = CheckSignUpForm()
    enum PasswordMessage: String {
        case Range = "8자 이상 16자 이하로 입력해주세요"
        case UpperCase = "영문 대문자를 최소 1자이상 포함해주세요"
        case Number = "숫자를 최소 1자 이상 포함해주세요"
        case Character = "특수문자를 최소 1자 이상 포함해주세요"
        case Success = "안전한 비밀번호입니다."
    }
    
    enum IDMessage: String {
        case Range = "5자이상 20자 이하로 입력해주세요"
        case Used = "이미 사용중인 아이디입니다."
        case Success = "사용 가능한 아이디입니다."
    }

    private static let idRegEx = "[a-z0-9-_]{5,20}"
    private static let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])(?=.*[0-9])[A-Za-z\\d$@$!%*?&]{8,16}"
    
    func inspectPassword(with password: String) -> Bool{
        var dictionary: [PasswordMessage:PasswordMessage.RawValue] = [:]
        
        guard let message = passwordCheck(with: password) else {
            dictionary = [PasswordMessage.Success : PasswordMessage.Success.rawValue]
            NotificationCenter.default.post(name: NotificationName.password, object: self, userInfo: dictionary)
            return true
        }
        
        dictionary = [message: message.rawValue]
        NotificationCenter.default.post(name: NotificationName.password, object: self, userInfo: dictionary)
        return false
    }
    
    func inspectID(with id: String) -> Bool {
        let temp = NSPredicate(format: "SELF MATCHES %@", "[a-z0-9-_]{5,20}")
        if !temp.evaluate(with: id) {
            NotificationCenter.default.post(name: NotificationName.id
                                            , object: nil,
                                            userInfo: [IDMessage.Range:IDMessage.Range.rawValue])
            return false
        }
        NetworkManager.connect() { (names) in
            DispatchQueue.main.async {
                if names.contains(id) {
                    NotificationCenter.default.post(name: NotificationName.id
                                                    , object: nil,
                                                    userInfo: [IDMessage.Used:IDMessage.Used.rawValue])
                } else {
                    NotificationCenter.default.post(name: NotificationName.id,
                                                    object: nil,
                                                    userInfo: [IDMessage.Success:IDMessage.Success.rawValue])
                }
            }
        }
        return true
    }
    
    private func passwordCheck(with password: String) -> CheckSignUpForm.PasswordMessage? {
        if let message = passwordRange(password) {
            return message
        }
        
        if let message = passwordUpperCase(password) {
            return message
        }
        
        if let message = passwordNumber(password) {
            return message
        }
        
        if let message = passwordSymbol(password) {
            return message
        }
        return nil
    }
    
    private func passwordUpperCase(_ password: String) -> CheckSignUpForm.PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[A-Z])")
        
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.UpperCase
    }
    
    private func passwordNumber(_ password: String) -> CheckSignUpForm.PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[0-9])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.Number
    }

    private func passwordSymbol(_ password: String) -> CheckSignUpForm.PasswordMessage? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[$@$!%*?&])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return PasswordMessage.Character
    }
    
    private func passwordRange(_ password: String) -> CheckSignUpForm.PasswordMessage? {
        if password.count < 8 || password.count > 16 {
            return PasswordMessage.Range
        }
        return nil
    }
}
