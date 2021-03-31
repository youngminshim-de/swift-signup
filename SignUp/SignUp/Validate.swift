//
//  Validate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import UIKit

class Validate {
    
    enum Message: String {
        case Range = "8자 이상 16자 이하로 입력해주세요"
        case UpperCase = "영문 대문자를 최소 1자이상 포함해주세요"
        case Number = "숫자를 최소 1자 이상 포함해주세요"
        case Character = "특수문자를 최소 1자 이상 포함해주세요"
        case Success = "안전한 비밀번호입니다."
    }

    private static let idRegEx = "[a-z0-9-_]{5,20}"
    private static let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])(?=.*[0-9])[A-Za-z\\d$@$!%*?&]{8,16}"
    
    func validate(with password: String) -> Bool{
        var dictionary: [Message:Message.RawValue] = [:]
        
        guard let message = passwordCheck(with: password) else {
            dictionary = [Message.Success : Message.Success.rawValue]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pw"), object: self, userInfo: dictionary)
            return true
        }
        
        dictionary = [message: message.rawValue]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pw"), object: self, userInfo: dictionary)
        return false
    }
    
    private func passwordCheck(with password: String) -> Validate.Message? {
        if let message = passwordRange(password) {
            return message
        }
        
        if let message = passwordUpperCase(password) {
            return message
        }
        
        if let message = passwordNumber(password) {
            return message
        }
        
        if let message = passwordCharacter(password) {
            return message
        }
        return nil
    }
    
    private func passwordUpperCase(_ password: String) -> Validate.Message? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[A-Z])")
        
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return Message.UpperCase
    }
    
    private func passwordNumber(_ password: String) -> Validate.Message? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[0-9])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return Message.Number
    }

    private func passwordCharacter(_ password: String) -> Validate.Message? {
        let regex = try? NSRegularExpression(pattern: "^(?=.*[$@$!%*?&])")
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return nil
        }
        return Message.Character
    }
    
    private func passwordRange(_ password: String) -> Validate.Message? {
        if password.count < 8 || password.count > 16 {
            return Message.Range
        }
        return nil
    }
    
    static func ID(with id: String) -> Bool {
        let temp = NSPredicate(format: "SELF MATCHES %@", idRegEx)
        return temp.evaluate(with: id)
    }
    
    static func password(with password: String) -> Bool {
        let temp = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return temp.evaluate(with: password)
    }
}
