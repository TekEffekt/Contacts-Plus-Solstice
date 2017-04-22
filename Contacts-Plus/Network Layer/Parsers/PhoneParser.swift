//
//  PhoneParser.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import SwiftyJSON

class PhoneParser: Parser {
    
    func parse(data: JSON) -> Phone? {
        
        let workPhone = data["work"].string
        let homePhone = data["home"].string
        let mobilePhone = data["mobile"].string
        
        return Phone(work: workPhone, home: homePhone, mobile: mobilePhone)
    }
    
}
