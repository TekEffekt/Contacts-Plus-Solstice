//
//  NetworkReachability.swift
//  Solstice Contacts
//
//  Created by Kyle Zawacki on 4/22/17.
//
//

import ReachabilitySwift

class NetworkReachability {
    
    static var shared: Reachability? = Reachability()
    
    static func setup() {
        do {
            try shared?.startNotifier()
        } catch(let error) {
            print("Reachability setup failed: \(error)")
        }
    }
    
    static func getStatus() -> Reachability.NetworkStatus {
        guard let reachability = shared else { return .notReachable }
        return reachability.currentReachabilityStatus
    }
    
}
