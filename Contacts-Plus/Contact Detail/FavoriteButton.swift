//
//  FavoriteButton.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/23/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import UIKit

class FavoriteButton: UIBarButtonItem {
    
    var favorited = false
    
    func toggle() {
        favorited = !favorited
        
        if favorited {
            image = #imageLiteral(resourceName: "Full Star")
        } else {
            image = #imageLiteral(resourceName: "Empty Star")
        }
    }
    
}
