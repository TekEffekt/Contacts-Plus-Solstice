//
//  NetworkConfiguration.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

class NetworkConfiguration {
    
    let baseUrl: NSURL
    var headers: [String: String] {
        return ["X-Auth-Token": NetworkAuth.shared.token ?? ""]
    }
    
    static var shared: NetworkConfiguration = NetworkConfiguration(urlString: "https://s3.amazonaws.com/technical-challenge")
    
    init(urlString: String) {
        baseUrl = NSURL(string: urlString) ?? NSURL()
    }
    
}
