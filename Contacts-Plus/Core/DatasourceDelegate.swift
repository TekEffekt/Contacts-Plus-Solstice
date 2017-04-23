//
//  DatasourceDelegate.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import UIKit

protocol DatasourceDelegate: class {
    func reloadTableView()
}

extension DatasourceDelegate where Self: UITableViewController {
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
}
