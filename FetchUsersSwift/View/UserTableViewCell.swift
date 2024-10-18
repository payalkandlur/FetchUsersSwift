//
//  UserTableViewCell.swift
//  FetchUsersSwift
//
//  Created by Payal Kandlur on 10/17/24.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var fistnameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
