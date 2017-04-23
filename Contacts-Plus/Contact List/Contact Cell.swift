//
//  ContactListCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit
import Imaginary

class ContactCell: ConfigurableCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    override func configure(withContact contact: Contact) {
        nameLabel.text = contact.name
        phoneNumberLabel.text = contact.phone.home
        if let imageUrl = URL(string: contact.smallImageUrl) {
            avatarImage.setImage(url: imageUrl)
        }
    }
    
}
