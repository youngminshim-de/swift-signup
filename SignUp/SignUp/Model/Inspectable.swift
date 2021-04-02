//
//  Validate.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/30.
//

import Foundation

@objc protocol Inspectable {
    @objc optional func inspect(with item: String) -> Any
    @objc optional func inspect(with item: String, with item2: String) -> Any
}

