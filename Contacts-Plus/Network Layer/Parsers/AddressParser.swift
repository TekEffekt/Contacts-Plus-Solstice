//
//  AddressParser.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import SwiftyJSON

class AddressParser: Parser {
    
    func parse(data: JSON) -> Address? {
        guard let street = data["street"].string else { return nil }
        guard let city = data["city"].string else { return nil }
        guard let state = data["state"].string else { return nil }
        guard let country = data["country"].string else { return nil }
        guard let zip = data["zip"].string else { return nil }
        guard let latitude = data["latitude"].double else { return nil }
        guard let longitude = data["longitude"].double else { return nil }
        
        return Address(street: street, city: city, state: state, country: country, zip: zip, latitude: latitude, longitude: longitude)
    }
    
}
