//
//  ReminderViewModel.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import Foundation

final class ReminderViewModel {
    let isLoading: Observable<Bool> = Observable(true)
    let isError: Observable<Bool> = Observable(false)
    let error: Observable<String> = Observable("")
    let reminders: Observable<[GetAllNotificationLog]> = Observable([])
    let userId: Observable<Int> = Observable(0)
    let indexPath: Observable<IndexPath> = Observable(nil)
    
    init() {}
    private func queryReminder() -> String {
        return """
        {
          getAllNotificationLogs(userId: \(userId.value ?? 0)) {
            id
            subject
            content
            toName
            key
            createdAt
          }
        }
        """
    }
    
    func fetchReminders() {
        ApolloClient.shared.call(body: queryReminder()) { (result: Result<NotificationLogName, ApolloError>) in
            switch result {
            case .success(let data):
                self.reminders.value = data.getAllNotificationLogs
                self.isError.value = false
            case .failure:
                self.error.value = "Failed to fetch reminders"
                self.isError.value = true
            }
            self.isLoading.value = false
        }
    }
}
