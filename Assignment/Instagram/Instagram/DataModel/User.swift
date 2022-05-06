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
    
    static let sampleUser1 = User(userName: "_Wallace_", password: "", profileImage: "avatar1", post: Post.semplePost1, story: true)
    static let sampleUser2 = User(userName: "gromit._.", password: "", profileImage: "avatar2", post: Post.semplePost2, story: true)
    static let sampleUser3 = User(userName: "campanula_Tottington", password: "", profileImage: "avatar3", post: Post.semplePost3, story: true)
    static let sampleUser4 = User(userName: "fluffle.s.", password: "", profileImage: "avatar4", post: Post.semplePost4, story: true)
    static let sampleUser5 = User(userName: "w.ndol.n.", password: "", profileImage: "avatar5", post: Post.semplePost5, story: true)
    static let sampleUser6 = User(userName: "a_Grand_Day", password: "", profileImage: "avatar6", post: Post.semplePost6, story: true)
}
