//
//  SignUpRequest.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation

struct SignUpRequest: Codable {
    let name: String
    let email: String
    let password: String
}
