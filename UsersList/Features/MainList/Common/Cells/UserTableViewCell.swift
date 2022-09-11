//
//  UserTableViewCell.swift
//  UsersList
//
//  Created by Clarence Montenegro Gallegos on 11/9/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    static let reuseIdentifier: String = String(describing: UserTableViewCell.self)
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(user: UserInfoElement) {
        nameLabel.text = user.name
        phoneLabel.text = user.phone
        emailLabel.text = user.email
    }
}
