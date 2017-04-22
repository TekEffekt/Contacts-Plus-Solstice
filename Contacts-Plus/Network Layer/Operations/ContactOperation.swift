//
//  ContactOperation.swift
//  Contacts-Plus
//
//  Created by Kyle Zawacki on 4/22/17.
//  Copyright © 2017 Kyle Zawacki. All rights reserved.
//

import Foundation

class ContactOperation: NetworkOperation {
    
    let contactParser: ContactParser
    
    var request: Request {
        return ContactRequest()
    }
    
    func execute(in dispatcher: Dispatcher = NetworkDispatcher(), completionHandler: @escaping (([Contact]?, NetworkResult) -> Void)) {
        do {
            try dispatcher.execute(request: request) { (response) in
                switch response {
                case .json(let data):
                    if let contacts = self.contactParser.parse(data: data) {
                        print(contacts)
                    }
                case .error(let statusCode, let error):
                    print("Error: \(error) Status Code: \(statusCode) ")
                    completionHandler(nil, .failure)
                default:
                    print("Wrong Response Data")
                    completionHandler(nil, .failure)
                }
            }
        } catch {
            print(error)
        }
    }
    
    init(parser: ContactParser = ContactParser()) {
        self.contactParser = parser
    }
    
}
