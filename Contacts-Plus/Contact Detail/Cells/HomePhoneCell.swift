//
//  HomePhoneCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class HomePhoneCell: PhoneCell {

    @IBOutlet weak var numberLabel: UILabel!

    override func configure(withContact contact: Contact) {
        numberLabel.text = contact.phone.home
        number = contact.phone.home
    }
    
}
