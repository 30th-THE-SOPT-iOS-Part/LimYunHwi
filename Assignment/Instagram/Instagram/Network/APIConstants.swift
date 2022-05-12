//
//  APIConstants.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation

struct APIConstants {
    //MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    //MARK: - Feature URL
    //signUpURL = "http://13.124.62.236/auth/signup"
    static let signUpURL = baseURL + "/auth/signup"
    
    //signInURL = "http://13.124.62.236/auth/signin"
    static let signInURL = baseURL + "/auth/signin"
}

//MARK: - Unsplash API
extension APIConstants {
    static let unsplashBaseURL = "https://api.unsplash.com"
    
    static let randomPhotosURL = unsplashBaseURL + "/photos/random"
    
}
