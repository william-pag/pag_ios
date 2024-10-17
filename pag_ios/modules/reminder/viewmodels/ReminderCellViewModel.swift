//
//  ReminderCellViewModel.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

final class ReminderCellViewModel {
    let id: Int
    let content: String
    let toName: String
    let subject: String
    let key: String
    let createdAt: String
    var isReadingMore: Bool
    
    init(reminder: GetAllNotificationLog) {
        self.id = reminder.id
        self.createdAt = UtilFormats.shared.formatDate(reminder.createdAt) ?? ""
        self.content = reminder.content
        self.toName = reminder.toName
        self.subject = reminder.subject
        self.key = reminder.key
        self.isReadingMore = false
    }
}
