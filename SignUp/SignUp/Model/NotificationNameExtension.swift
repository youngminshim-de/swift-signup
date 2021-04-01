//
//  NotificationNameExtension.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/31.
//

import Foundation
enum NotificationName {
    static let id = Foundation.Notification.Name("idCheck")
    static let password = Foundation.Notification.Name("passwordCheck")
    static let userName = Foundation.Notification.Name("userNameCheck")
}
