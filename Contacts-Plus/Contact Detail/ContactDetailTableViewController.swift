//
//  ContactDetailTableViewController.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class ContactDetailTableViewController: UITableViewController, DatasourceDelegate, EditContactDelegate {

    var contact: Contact!
    var datasource: ContactDetailDatasource!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        datasource = ContactDetailDatasource(contact: contact, delegate: self)
        tableView.dataSource = datasource
        tableView.reloadData()
        navigationItem.title = contact.name
    }
    
    @IBAction func favoriteTapped(_ sender: FavoriteButton) {
        sender.toggle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let editContactVc = segue.destination as? EditContactTableViewController {
            editContactVc.contact = contact
            editContactVc.delegate = self
        }
    }
    
    func update(with contact: Contact) {
        self.contact = contact
        tableView.reloadData()
    }
    
}
