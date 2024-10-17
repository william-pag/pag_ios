//
//  ReminderTableViewCell.swift
//  pag_ios
//
//  Created by William Vux on 15/10/24.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    
    static let identifier: String = "ReminderTableViewCell"
    static let nib: UINib = UINib(nibName: identifier, bundle: nil)

    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtReadmore: UILabel!
    @IBOutlet weak var txtContent: UILabel!
    @IBOutlet weak var txtSubject: UILabel!
    @IBOutlet weak var txtDatetime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        viewContent.layer.cornerRadius = 0
        viewContent.layer.borderWidth = 0.5
    }
    
    override func prepareForReuse() {
        txtName.text = ""
        txtContent.text = ""
        txtSubject.text = ""
        txtDatetime.text = ""
    }
    
    func bind(vm reminder: ReminderCellViewModel) {
        self.txtContent.attributedText = UtilFormats.shared.htmlString(str: reminder.content)
        self.txtName.text = reminder.toName
        self.txtSubject.text = reminder.subject
        self.txtDatetime.text = reminder.createdAt
        if reminder.isReadingMore {
            self.txtReadmore.text = "Read more"
            self.txtContent.numberOfLines = 0
        } else {
            self.txtReadmore.text = "Read less"
            self.txtContent.numberOfLines = 1
        }
    }

    
}
