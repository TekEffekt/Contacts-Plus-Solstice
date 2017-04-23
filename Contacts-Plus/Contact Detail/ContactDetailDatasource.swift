//
//  ContactDetailDatasource.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import UIKit

class ContactDetailDatasource: NSObject, UITableViewDataSource {
    
    let contact: Contact
    let delegate: DatasourceDelegate
    
    init(contact: Contact, delegate: DatasourceDelegate) {
        self.contact = contact
        self.delegate = delegate
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return getSectionNumber()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getRowNumber(for: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = getCellId(forIndex: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ConfigurableCell else {
            return UITableViewCell()
        }
        cell.configure(withContact: contact)
        
        return cell
    }
    
    private func getSectionNumber() -> Int {
        var base = 5
        if contact.phone.home != nil || contact.phone.mobile != nil || contact.phone.work != nil {
            base += 1
        }
        return base
    }
    
    private func getRowNumber(for section: Int) -> Int {
        if section < 5 {
            return 1
        } else {
            var numberOfPhones = 0
            numberOfPhones += contact.phone.mobile != nil ? 1 : 0
            numberOfPhones += contact.phone.work != nil ? 1 : 0
            numberOfPhones += contact.phone.home != nil ? 1 : 0
            return numberOfPhones
        }
    }
    
    private func getCellId(forIndex indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0:
            return "Name Cell"
        case 1:
            return "Company Cell"
        case 2:
            return "Address Cell"
        case 3:
            return "Email Cell"
        case 4:
            return "Website Cell"
        case 5:
            if indexPath.row == 0 {
                return "Mobile Phone Cell"
            } else if indexPath.row == 1 {
                return "Home Phone Cell"
            } else {
                return "Work Phone Cell"
            }
        default:
            return ""
        }
    }
    
}
