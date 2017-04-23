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
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getRowNumber()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = getCellId(forRow: indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: id) as? ConfigurableCell else {
            return UITableViewCell()
        }
        cell.configure(withContact: contact)
        
        return cell
    }
    
    private func getRowNumber() -> Int {
        var base = 5
        base += contact.phone.home != nil ? 1 : 0
        base += contact.phone.work != nil ? 1 : 0
        base += contact.phone.mobile != nil ? 1 : 0
        return base
    }
    
    private func getCellId(forRow row: Int) -> String {
        switch row {
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
            return "Mobile Phone Cell"
        case 6:
            return "Home Phone Cell"
        case 7:
            return "Work Phone Cell"
        default:
            return ""
        }
    }
    
}
