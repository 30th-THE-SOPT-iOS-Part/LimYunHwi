//
//  NetworkResult.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
