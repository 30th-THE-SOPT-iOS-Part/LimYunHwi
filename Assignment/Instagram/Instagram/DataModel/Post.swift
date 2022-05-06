//
//  Post.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/04.
//

import Foundation

struct Post {
    var image: String
    var content: String
    var like: Int
    var comments: [Comment]
}

extension Post {
    static let semplePost1 = Post(image: "Image_1", content: "넓고 푸른 꼬꼬마 동산에 텔레토비 친구들이 살고있어요", like: 1001, comments: [Comment.sampleComment1])
    static let semplePost2 = Post(image: "Image_2", content: "하나 하나 둘 둘 셋 셋 오 넷 넷", like: 55, comments: [Comment.sampleComment2])
    static let semplePost3 = Post(image: "Image_3", content: "꼬꼬마 텔레토비", like: 91, comments: [Comment.sampleComment3])
    static let semplePost4 = Post(image: "Image_4", content: "꼬꼬마 텔레토비 시간이예요 텔레토비 친구들 안녕 텔레토비 친구들 안녕", like: 76, comments: [Comment.sampleComment4])
    static let semplePost5 = Post(image: "Image_5", content: "보라돌이 뚜비 나나 뽀 텔레토비 텔레토비 친구들 안녕", like: 189, comments: [Comment.sampleComment5])
    static let semplePost6 = Post(image: "Image_6", content: "보라돌이 뚜비 나나 뽀 텔레토비 텔레토비 아이 좋아", like: 345, comments: [Comment.sampleComment6])
}
