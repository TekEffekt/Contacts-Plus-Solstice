//
//  EmailCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class EmailCell: ConfigurableCell {

    @IBOutlet weak var emailLabel: UILabel!
    var email: String!

    override func configure(withContact contact: Contact) {
        emailLabel.text = contact.email
        email = contact.email
    }
    
}
