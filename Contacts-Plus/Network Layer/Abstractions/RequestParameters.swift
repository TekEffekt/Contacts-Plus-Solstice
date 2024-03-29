//
//  RequestParameters.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

enum RequestParameters {
    case body(_ : [String: Any]?)
    case url(_ : [String: Any]?)
    case image(_: Data)
}
