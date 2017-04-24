//
//  EditContactTableViewController.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/23/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

protocol EditContactDelegate: class {
    func update(with contact: Contact)
}

class EditContactTableViewController: FormTableViewController {

    var contact: Contact!
    @IBOutlet var editTextFields: [EditContactTextField]!
    weak var delegate: EditContactDelegate?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTextFields()
    }
    
    private func setupTextFields() {
        for (i, textField) in editTextFields.enumerated() {
            textField.type = EditCellType(rawValue: i)
            textField.text = textField.type.string(for: contact)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        editContact()
        delegate?.update(with: contact)
    }
    
    func editContact() {
        for textField in editTextFields {
            switch textField.type! {
            case .name:
                contact.name = textField.text ?? ""
            case .company:
                contact.company = textField.text ?? ""
            case .street:
                contact.address.street = textField.text ?? ""
            case .state:
                contact.address.state = textField.text ?? ""
            case .city:
                contact.address.city = textField.text ?? ""
            case .zip:
                contact.address.zip = textField.text ?? ""
            case .country:
                contact.address.country = textField.text ?? ""
            case .email:
                contact.email = textField.text ?? ""
            case .website:
                contact.website = textField.text ?? ""
            case .mobilePhone:
                contact.phone.mobile = textField.text
            case .homePhone:
                contact.phone.home = textField.text
            case .workPhone:
                contact.phone.work = textField.text
            }
        }
    }
    
}
