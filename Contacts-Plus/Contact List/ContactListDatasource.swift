//
//  ContactListDatasource.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import UIKit

class ContactListDatasource: NSObject, UITableViewDataSource {
    
    var contacts: [Contact]
    let delegate: DatasourceDelegate
    
    init(contacts: [Contact] = [], delegate: DatasourceDelegate) {
        self.contacts = contacts
        self.delegate = delegate
        super.init()
        loadData()
    }
    
    private func loadData() {
        let contactOp = ContactOperation()
        contactOp.execute { (contacts, result) in
            if let contacts = contacts {
                self.contacts = contacts
                OperationQueue.main.addOperation {
                    self.delegate.reloadTableView()
                }
                print(contacts.count)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Contact Cell") as? ContactCell else { return UITableViewCell() }
        let contact = contacts[indexPath.row]
        cell.nameLabel.text = contact.name
        return cell
    }
    
}
