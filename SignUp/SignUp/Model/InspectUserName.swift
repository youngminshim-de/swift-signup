//
//  InspectUserName.swift
//  SignUp
//
//  Created by 심영민 on 2021/04/02.
//

import Foundation

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
