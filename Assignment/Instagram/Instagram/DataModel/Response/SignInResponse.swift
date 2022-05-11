//
//  SignInResponse.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation

struct SignInResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpData?
}

struct SignInData: Codable {
    let name: String
    let email: String
}
