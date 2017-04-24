//
//  WebsiteCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class WebsiteCell: ConfigurableCell {

    @IBOutlet weak var websiteLabel: UILabel!
    var website: String!

    override func configure(withContact contact: Contact) {
        websiteLabel.text = contact.website
        website = contact.website
    }
    
}
