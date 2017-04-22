//
//  Request+Headers.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/21/17.
//  
//

import Foundation

extension Request {
    
    func getJsonHeader() -> [String: String] {
        return ["Content-Type" : "application/json"]
    }
    
}
