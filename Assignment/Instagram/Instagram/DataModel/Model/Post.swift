//
//  Post.swift
//  Instagram
//
//  Created by ์์คํ on 2022/05/04.
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
    static let semplePost1 = Post(image: "Image_1", content: "๐จ๐ปโ๐ฆฒ์๋ ์ค์ ๊ทธ๋ก๋ฐ๐ถ", numberOfLike: 1001, comments: [Comment.sampleComment1, Comment.sampleComment2, Comment.sampleComment3, Comment.sampleComment4], like: false)
    static let semplePost2 = Post(image: "Image_2", content: "๐งโ๐ณA Matter of Loaf and Death๐งโ๐ณ", numberOfLike: 55, comments: [Comment.sampleComment1,Comment.sampleComment2], like: false)
    static let semplePost3 = Post(image: "Image_3", content: "FOREVER๐๐ถFOREVER", numberOfLike: 91, comments: [Comment.sampleComment3], like: false)
    static let semplePost4 = Post(image: "Image_4", content: "๐งโ๐ง๐ถ", numberOfLike: 76, comments: [Comment.sampleComment4], like: false)
    static let semplePost5 = Post(image: "Image_5", content: "๐บ๐น๐ธ๐ฅ๐ป๐ท", numberOfLike: 189, comments: [Comment.sampleComment4, Comment.sampleComment5], like: false)
    static let semplePost6 = Post(image: "Image_6", content: "๊ฐ์กฑ ์ฌ์ง ์ฐ์ ๋  ๐ธ", numberOfLike: 345, comments: [Comment.sampleComment6], like: false)
}
