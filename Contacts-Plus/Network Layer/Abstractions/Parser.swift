//
//  Parser.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 4/7/17.
//
//

import Foundation

protocol Parser {
    
    associatedtype Output
    associatedtype Input
    
    func parse(data: Input) -> Output?
    
}
