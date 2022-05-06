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
    static let semplePost1 = Post(image: "Image_1", content: "👨🏻‍🦲월레스와 그로밋🐶", like: 1001, comments: [Comment.sampleComment1])
    static let semplePost2 = Post(image: "Image_2", content: "🧑‍🍳A Matter of Loaf and Death🧑‍🍳", like: 55, comments: [Comment.sampleComment2])
    static let semplePost3 = Post(image: "Image_3", content: "FOREVER😘🐶FOREVER", like: 91, comments: [Comment.sampleComment3])
    static let semplePost4 = Post(image: "Image_4", content: "🧑‍🔧🐶", like: 76, comments: [Comment.sampleComment4])
    static let semplePost5 = Post(image: "Image_5", content: "🎺🎹🎸🥁🎻🎷", like: 189, comments: [Comment.sampleComment5])
    static let semplePost6 = Post(image: "Image_6", content: "가족 사진 찍은 날 📸", like: 345, comments: [Comment.sampleComment6])
}
