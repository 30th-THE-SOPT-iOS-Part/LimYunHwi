//
//  RandomPhotoResponse.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/12.
//

import Foundation

struct RandomPhotosResponse: Codable {
    let links:LinksData
}

struct LinksData: Codable {
    let download: String
}
