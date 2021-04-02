//
//  InspectID.swift
//  SignUp
//
//  Created by 심영민 on 2021/04/02.
//

import Foundation

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
