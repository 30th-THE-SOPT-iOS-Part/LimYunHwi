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
    var numberOfLike: Int
    var comments: [Comment]
    var like: Bool
}

extension Post {
    static let semplePost1 = Post(image: "Image_1", content: "👨🏻‍🦲월레스와 그로밋🐶", numberOfLike: 1001, comments: [Comment.sampleComment1, Comment.sampleComment2, Comment.sampleComment3, Comment.sampleComment4], like: false)
    static let semplePost2 = Post(image: "Image_2", content: "🧑‍🍳A Matter of Loaf and Death🧑‍🍳", numberOfLike: 55, comments: [Comment.sampleComment1,Comment.sampleComment2], like: false)
    static let semplePost3 = Post(image: "Image_3", content: "FOREVER😘🐶FOREVER", numberOfLike: 91, comments: [Comment.sampleComment3], like: false)
    static let semplePost4 = Post(image: "Image_4", content: "🧑‍🔧🐶", numberOfLike: 76, comments: [Comment.sampleComment4], like: false)
    static let semplePost5 = Post(image: "Image_5", content: "🎺🎹🎸🥁🎻🎷", numberOfLike: 189, comments: [Comment.sampleComment4, Comment.sampleComment5], like: false)
    static let semplePost6 = Post(image: "Image_6", content: "가족 사진 찍은 날 📸", numberOfLike: 345, comments: [Comment.sampleComment6], like: false)
}
