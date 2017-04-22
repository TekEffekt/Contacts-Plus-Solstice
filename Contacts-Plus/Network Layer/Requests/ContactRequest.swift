//
//  ContactRequest.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation

struct ContactRequest: Request {
    
    var endpoint: String {
        return "Contacts.json"
    }
    
    var method: HttpMethod {
        return .get
    }

    var parameters: RequestParameters? {
        return nil
    }
    
    var headers: [String : String]? {
        return getJsonHeader()
    }
    
    var dataType: DataType {
        return .json
    }
    
}
