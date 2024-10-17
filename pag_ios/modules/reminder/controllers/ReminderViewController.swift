//
//  ReminderViewController.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import UIKit

class ReminderViewController: UIViewController {
    let reminderViewModel: ReminderViewModel = ReminderViewModel()
    
    @IBOutlet weak var tbReminder: UITableView!
    @IBOutlet weak var dropdown: UIView!
    @IBOutlet weak var lbDropdown: UILabel!
    @IBOutlet weak var boxDropdown: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        bindData()
    }
    
    @IBAction func handleDropdown(_ sender: UIButton) {
    }
    private func setupView() {
        setupTableView()
        dropdown.layer.borderWidth = 0.5
        dropdown.layer.cornerRadius = 5
        boxDropdown.layer.borderColor = UIColor.lightGray.cgColor
        boxDropdown.layer.borderColor = UIColor.lightGray.cgColor
        boxDropdown.addBorder(to: .left, in: .lightGray, width: 0.5)
    }
    private func bindViewModel() {
        reminderViewModel.reminders.bind { _ in
            self.tbReminder.reloadData()
        }
        
        reminderViewModel.indexPath.bind { indexPath in
            if let indexPath {
                self.tbReminder.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    private func bindData() {
        reminderViewModel.fetchReminders()
    }

}
