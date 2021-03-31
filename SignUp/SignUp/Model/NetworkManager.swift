//
//  NetworkManager.swift
//  SignUp
//
//  Created by 심영민 on 2021/03/31.
//

import UIKit

class NetworkManager {
    static func connect(handler: @escaping ([String]) -> Void) {
        
        guard let url = URL(string: "https://8r6ruzgzve.execute-api.ap-northeast-2.amazonaws.com/default/SwiftCamp") else {
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data,
                  let userResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String] else {
                return
            }
            handler(userResponse)
        }.resume()
    }
}
