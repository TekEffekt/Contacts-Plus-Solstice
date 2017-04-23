//
//  ContactListTableViewController.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class ContactListTableViewController: UITableViewController, DatasourceDelegate {

    var datasource: ContactListDatasource!
    
    override func viewDidLoad() {
        datasource = ContactListDatasource(delegate: self)
        tableView.dataSource = datasource
    }

}
