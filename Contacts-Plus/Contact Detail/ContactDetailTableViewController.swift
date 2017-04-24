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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView.cellForRow(at: indexPath) as? AddressCell) != nil {
            openMap()
        } else if let phoneCell = tableView.cellForRow(at: indexPath) as? PhoneCell {
            call(withNumber: phoneCell.number)
        } else if (tableView.cellForRow(at: indexPath) as? WebsiteCell) != nil {
            openWebsite()
        } else if (tableView.cellForRow(at: indexPath) as? EmailCell) != nil {
            openEmail()
        }
    }
    
    func openMap() {
        let baseUrl : String = "http://maps.apple.com/?q="
        let name = "\(contact.address.street) \(contact.address.city)"
        let encodedName = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let finalUrl = baseUrl + encodedName!
        
        let url = URL(string: finalUrl)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func call(withNumber number: String) {
        let stringArray = number.components(
            separatedBy: NSCharacterSet.decimalDigits.inverted)
        let digitsOnly = stringArray.joined(separator: "")
        if let url = URL(string: "tel://\(digitsOnly)") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openWebsite() {
        if let url = URL(string: contact.website) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func openEmail() {
        let urlString = "mailto:\(contact.email)"
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
