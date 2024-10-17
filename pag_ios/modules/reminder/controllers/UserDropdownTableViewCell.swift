//
//  UserTableViewCell.swift
//  pag_ios
//
//  Created by William Vux on 16/10/24.
//

import UIKit

class UserDropdownTableViewCell: UITableViewCell {
    static let identifier: String = "UserTableViewCell"
    static let nib: UINib = UINib(nibName: "UserTableViewCell", bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
