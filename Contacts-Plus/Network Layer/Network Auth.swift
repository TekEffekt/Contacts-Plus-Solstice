//
//  NetworkAuth.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 8/30/16.
//  
//

import Foundation

class NetworkAuth {
    
    private let key = "NetworkAuthToken"
    static var shared: NetworkAuth!
    let defaults = UserDefaults.standard
    
    func setToken(_ token: String) {
        defaults.setValue(token, forKey: key)
    }
    
    var token: String? {
        if let token = defaults.value(forKey: key) as? String {
            return "\(token)"
        } else {
            return nil
        }
    }
    
    func deleteToken() {
        defaults.removeObject(forKey: key)
    }
    
}
