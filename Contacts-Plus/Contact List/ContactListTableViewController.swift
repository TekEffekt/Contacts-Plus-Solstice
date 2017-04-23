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
    var chosenContact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datasource = ContactListDatasource(delegate: self)
        tableView.dataSource = datasource
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = datasource.contacts[indexPath.row]
        chosenContact = contact
        performSegue(withIdentifier: "Show Contact Detail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVc = segue.destination as? ContactDetailTableViewController {
            detailVc.contact = chosenContact
        }
    }
    
}
