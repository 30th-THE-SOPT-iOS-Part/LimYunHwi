//
//  SignInRequest.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation

struct SignInRequest: Codable {
    let name: String
    let email: String
    let password: String
}
