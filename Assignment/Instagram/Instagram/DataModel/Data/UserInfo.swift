//
//  UserInfo.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/12.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    
    var name: String?
    var email: String?
    
    private init() { }
}
