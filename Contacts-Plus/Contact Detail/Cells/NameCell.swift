//
//  NameCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class NameCell: ConfigurableCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    override func configure(withContact contact: Contact) {
        nameLabel.text = contact.name
    }
    
}
