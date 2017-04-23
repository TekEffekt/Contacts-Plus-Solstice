//
//  ContactDetailTableViewController.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class ContactDetailTableViewController: UITableViewController, DatasourceDelegate {

    var contact: Contact!
    var datasource: ContactDetailDatasource!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datasource = ContactDetailDatasource(contact: contact, delegate: self)
        tableView.dataSource = datasource
    }
    
}
