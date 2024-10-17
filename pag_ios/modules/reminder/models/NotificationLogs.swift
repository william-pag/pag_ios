//
//  NotificationLogs.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

struct NotificationLogName: Codable {
    let getAllNotificationLogs: [GetAllNotificationLog]
}

// MARK: - GetAllNotificationLog
struct GetAllNotificationLog: Codable {
    let id: Int
    let content: String
    let toName: String
    let subject: String
    let key: String
    let createdAt: String
}
