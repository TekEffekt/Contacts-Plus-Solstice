//
//  Operation.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

protocol NetworkOperation {
    
    associatedtype Output
    
    var request: Request { get }
    
    func execute(in dispatcher: Dispatcher, completionHandler: @escaping ((Output, NetworkResult) -> Void))
    
}
