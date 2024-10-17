//
//  UITableView+Extension.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import UIKit

extension ReminderViewController: UITableViewDataSource, UITableViewDelegate {
    func setupTableView() {
        tbReminder.dataSource = self
        tbReminder.delegate = self
        tbReminder.showsVerticalScrollIndicator = false
        tbReminder.rowHeight = UITableView.automaticDimension
        tbReminder.register(ReminderTableViewCell.nib, forCellReuseIdentifier: ReminderTableViewCell.identifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderViewModel.reminders.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReminderTableViewCell.identifier, for: indexPath) as? ReminderTableViewCell,
              let reminder = reminderViewModel.reminders.value?[indexPath.row] else {
            return UITableViewCell()
        }
        let vm = ReminderCellViewModel(reminder: reminder)
        vm.isReadingMore = reminderViewModel.indexPath.value?.row == indexPath.row
        cell.bind(vm: vm)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tbReminder.deselectRow(at: indexPath, animated: true)
        if reminderViewModel.indexPath.value != nil {
            reminderViewModel.indexPath.value = .none
            self.tbReminder.reloadRows(at: [indexPath], with: .none)
        } else {
            reminderViewModel.indexPath.value = indexPath
        }
    }
}
