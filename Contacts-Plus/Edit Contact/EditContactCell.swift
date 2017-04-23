//
//  EditContactCell.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/23/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class EditContactCell: ConfigurableCell {

    var cellType: EditCellType!
    @IBOutlet weak var textField: UITextField!
    
    override func configure(withContact contact: Contact) {
        textField.placeholder = cellType.getCellTitle()
        textField.text = cellType.string(for: contact)
    }

}
