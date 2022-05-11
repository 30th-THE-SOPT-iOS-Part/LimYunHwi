//
//  UserService.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/11.
//

import Foundation
import Alamofire

class UserService {
    //MARK: - Properties
    static let shared = UserService()
    var decodingType: NetworkDecodingType?
    
    //MARK: - Request And Response
    func signUp(
        name: String,
        email: String,
        password: String,
        completion: @escaping (NetworkResult<Any>)->Void
    ){
        decodingType = .signUp
        
        let url = APIConstants.signUpURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name" : name,
            "email" : email,
            "password" : password
        ]
        
        let dataRequest = AF.request(url,
                                 method: .post,
                                 parameters: body,
                                 encoding: JSONEncoding.default,
                                 headers: headers)
        
        dataRequest.responseData{ response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                
                let networkResult = self.checkStatus(statusCode, data: value)
                completion(networkResult)
            case .failure :
                completion(.networkFail)
            }
        }
    }
    
    func signIn(name: String,
                email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void
    ){
        decodingType = .signIn
        
        let url = APIConstants.signInURL
        let headers: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name" : name,
            "email" : email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: headers)
        
        dataRequest.responseData{ response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                let networkResult = self.checkStatus(statusCode, data: value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    //MARK: - decoding process
    private func checkStatus(_ status: Int, data: Data) -> NetworkResult<Any>{
        switch status {
        case 200..<300 : return isValidData(data)
        case ..<400 : return .pathErr
        case ..<500 : return .serverErr
        default : return .networkFail
        }
    }
    
    private func isValidData(_ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodingType = decodingType else {return .pathErr}
        
        switch decodingType {
        case .signUp :
            guard let decodeData = try? decoder.decode(SignUpResponse.self, from: data) else {return .pathErr}
            return .success(decodeData as Any)
        case .signIn:
            guard let decodeDate = try? decoder.decode(SignInResponse.self, from: data) else {return .pathErr}
            return .success(decodeDate as Any)
        }
    }
}
