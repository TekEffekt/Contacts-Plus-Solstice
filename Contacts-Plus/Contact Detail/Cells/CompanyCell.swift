//
//  CompanyCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class CompanyCell: ConfigurableCell {

    @IBOutlet weak var companyLabel: UILabel!
    var company: String!

    override func configure(withContact contact: Contact) {
        companyLabel.text = contact.company
        company = contact.company
    }
}
