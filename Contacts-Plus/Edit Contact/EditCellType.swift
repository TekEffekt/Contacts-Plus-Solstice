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
    case email = 2
    case street = 3
    case state = 4
    case city = 5
    case zip = 6
    case country = 7
    case website = 8
    case mobilePhone = 9
    case homePhone = 10
    case workPhone = 11
    
    func string(for contact: Contact) -> String? {
        switch self {
        case .name:
            return contact.name
        case .company:
            return contact.company
        case .street:
            return contact.address.street
        case .state:
            return contact.address.state
        case .city:
            return contact.address.city
        case .zip:
            return contact.address.zip
        case .country:
            return contact.address.country
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
