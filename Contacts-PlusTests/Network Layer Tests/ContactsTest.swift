//
//  LoginTests.swift
//
//  Created by Kyle Zawacki on 4/8/17.
//
//

import XCTest
@testable import Contacts_Plus

class ContactsMock: Dispatcher {
    
    var configuration: NetworkConfiguration
    
    required init(configuration: NetworkConfiguration = NetworkConfiguration.shared) {
        self.configuration = configuration
    }
    
    func execute(request: Request, completionHandler: @escaping ((Response) -> Void)) throws {
        let testBundle = Bundle(for: type(of: self))
        guard let path = testBundle.path(forResource: "Contact", ofType: "json") else {
            return
        }
        
        let mockData = NSData(contentsOfFile: path)
        let resp = HTTPURLResponse(url: URL(string: path)!, statusCode: 200, httpVersion: nil, headerFields: nil)
        
        let response = Response(urlResponse: resp, data: mockData as Data?, error: nil, for: request)
        completionHandler(response)
    }
    
}

class ContactsTest: XCTestCase {
    
    let mock = ContactsMock()
    
    func testOperation() {
        let op = ContactOperation()
        let expect = expectation(description: "Calls the callback and passes a list of contacts")
        op.execute(in: mock) { (contacts, result) in
            XCTAssertEqual(contacts!.count, 17)
            let firstContact = contacts!.first!
            XCTAssertEqual(firstContact.name, "Essie Vaill")
            XCTAssertEqual(firstContact.company, "Litronic Industries")
            XCTAssertEqual(firstContact.email, "essie@vaill.com")
            XCTAssertEqual(firstContact.website, "http://www.solstice-mobile.com")
            XCTAssertEqual(firstContact.phone.mobile, "650-252-4010")
            XCTAssertEqual(firstContact.phone.home, "602-252-4009")
            XCTAssertEqual(firstContact.phone.work, "602-252-4827")
            XCTAssertEqual(firstContact.address.street, "28 W 27th St")
            XCTAssertEqual(firstContact.address.city, "New York")
            XCTAssertEqual(firstContact.address.state, "NY")
            XCTAssertEqual(firstContact.address.zip, "10001")
            XCTAssertEqual(firstContact.address.latitude, 40.744779999999999)
            XCTAssertEqual(firstContact.address.longitude, -73.989872000000005)

            expect.fulfill()
        }
        waitForExpectations(timeout: 0.01, handler: nil)
    }
    
}
