//
//  InspectPassword.swift
//  SignUp
//
//  Created by 심영민 on 2021/04/02.
//

import Foundation

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
