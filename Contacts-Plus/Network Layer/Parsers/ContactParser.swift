//
//  ContactParser.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation
import SwiftyJSON

class ContactParser: Parser {
    
    let phoneParser: PhoneParser
    let addressParser: AddressParser
    
    func parse(data: Data) -> [Contact]? {
        let json = JSON(data: data)
        var contacts: [Contact] = []

        guard let contactsJson = json.array else { return nil }
        for contactJson in contactsJson {
            if let name = contactJson["name"].string,
                let company = contactJson["company"].string,
                let favorite = contactJson["favorite"].bool,
                let smallImageURL = contactJson["smallImageURL"].string,
                let largeImageURL = contactJson["largeImageURL"].string,
                let email = contactJson["email"].string,
                let website = contactJson["website"].string,
                let phone = phoneParser.parse(data: contactJson["phone"]),
                let address = addressParser.parse(data: contactJson["address"])
                {
                let contact = Contact(name: name, company: company, favorite: favorite, smallImageUrl: smallImageURL, largeImageUrl: largeImageURL, email: email, website: website, phone: phone, address: address)
                contacts.append(contact)
            }
        }
        
        return contacts
    }
    
    init(phoneParser: PhoneParser = PhoneParser(), addressParser: AddressParser = AddressParser()) {
        self.phoneParser = phoneParser
        self.addressParser = addressParser
    }
    
}
