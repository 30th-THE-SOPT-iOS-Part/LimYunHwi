//
//  NotificationName.swift
//  Instagram
//
//  Created by 임윤휘 on 2022/05/08.
//

import Foundation

struct NotificationName {
    enum name: String {
        case like = "DidLikeNotification"
    }
    
    static let like = Notification.Name(name.like.rawValue)
}
