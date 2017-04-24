//
//  AddressCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class AddressCell: ConfigurableCell {

    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var zipCountryLabel: UILabel!
    var address: Address!

    override func configure(withContact contact: Contact) {
        address = contact.address
        streetLabel.text = contact.address.street
        cityStateLabel.text = "\(contact.address.city) \(contact.address.state)"
        zipCountryLabel.text = "\(contact.address.zip) \(contact.address.country)"
    }
    
}
