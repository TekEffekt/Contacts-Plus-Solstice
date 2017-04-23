//
//  Edit Contact Datasource.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/23/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import UIKit

enum EditCellType: Int {
    case name = 0
    case company = 1
    case address = 2
    case email = 3
    case website = 4
    case mobilePhone = 5
    case homePhone = 6
    case workPhone = 7
    
    static func totalCells() -> Int {
        return 8
    }
    
    func getCellTitle() -> String {
        switch self {
        case .name:
            return "Name"
        case .company:
            return "Company"
        case .address:
            return "Address"
        case .email:
            return "Email"
        case .website:
            return "Website"
        case .mobilePhone:
            return "Mobile Phone"
        case .homePhone:
            return "Home Phone"
        case .workPhone:
            return "Work Phone"
        }
    }
    
    func string(for contact: Contact) -> String? {
        switch self {
        case .name:
            return contact.name
        case .company:
            return contact.company
        case .address:
            return contact.address.street
        case .email:
            return contact.email
        case .website:
            return contact.website
        case .mobilePhone:
            return contact.phone.mobile
        case .homePhone:
            return contact.phone.home
        case .workPhone:
            return contact.phone.work
        }
    }
}

class EditContactDatasource: NSObject, UITableViewDataSource {
    
    var contact: Contact!
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EditCellType.totalCells()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Edit Cell") as? EditContactCell else {
            return UITableViewCell()
        }
        
        guard let cellType = EditCellType(rawValue: indexPath.section) else { return UITableViewCell() }
        cell.cellType = cellType
        cell.configure(withContact: contact)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let cellType = EditCellType(rawValue: section) else { return nil }
        return cellType.getCellTitle()
    }
    
}
