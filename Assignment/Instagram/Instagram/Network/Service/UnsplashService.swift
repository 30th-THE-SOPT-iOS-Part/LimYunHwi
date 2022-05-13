//
//  UnsplashService.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/12.
//

import Foundation
import Alamofire

class UnsplashService {
    static let shared = UnsplashService()
    
    private init() { }
    
    //MARK: - Request And Response
    func getRandomPhotos(count: Int,
                         completion: @escaping (NetworkResult<Any>) -> Void
    ){
        let url = APIConstants.randomPhotosURL
        let headers: HTTPHeaders = ["Authorization" : "Client-ID YOUR_ACCESS_KEY"] //YOUR_ACCESS_KEY must remain confidential
        let params: Parameters = ["count" : count]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: params,
                                     encoding: URLEncoding.default,
                                     headers: headers)
        
        dataRequest.responseData{ [weak self] response in
            switch response.result {
            case .success :
                guard let statusCode = response.response?.statusCode else {return}
                guard let value = response.value else {return}
                guard let networkResult = self?.checkStatus(statusCode, data: value) else {return}
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    //MARK: - decoding process
    private func checkStatus(_ status: Int, data: Data) -> NetworkResult<Any> {
        switch status {
        case 200..<300: return isValidData(data)
        case 400..<500: return .pathErr
        case ..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(_ data: Data)-> NetworkResult<Any>{
        let decoder = JSONDecoder()
        
        guard let data = try? decoder.decode([RandomPhotosResponse].self, from: data) else {return .pathErr}
        return .success(data as Any)
    }
}
