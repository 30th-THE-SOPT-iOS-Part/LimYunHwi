//
//  User.swift
//  Instagram
//
//  Created by limyunhwi on 2022/04/07.
//

import Foundation

struct User {
    var userName: String
    var password: String
    var profileImage: String?
    var post: Post?
    var story: Bool?
}

extension User {
    static let sampleUser: [User] = [
        sampleUser1,
        sampleUser2,
        sampleUser3,
        sampleUser4,
        sampleUser5,
        sampleUser6
    ]
    
    static let sampleUser1 = User(userName: "teletubbies", password: "", profileImage: "avatar1", post: Post.semplePost1, story: true)
    static let sampleUser2 = User(userName: "sun._.baby", password: "", profileImage: "avatar2", post: Post.semplePost2, story: true)
    static let sampleUser3 = User(userName: "tinky_winky", password: "", profileImage: "avatar3", post: Post.semplePost3, story: true)
    static let sampleUser4 = User(userName: "laa.laa", password: "", profileImage: "avatar4", post: Post.semplePost4, story: true)
    static let sampleUser5 = User(userName: "dips.y.", password: "", profileImage: "avatar5", post: Post.semplePost5, story: true)
    static let sampleUser6 = User(userName: "po___", password: "", profileImage: "avatar6", post: Post.semplePost6, story: true)
}
