//
//  EditContactTableViewController.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/23/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class EditContactTableViewController: FormTableViewController {

    var datasource: EditContactDatasource!
    var contact: Contact!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        datasource = EditContactDatasource(contact: contact)
        tableView.dataSource = datasource
    }

}
