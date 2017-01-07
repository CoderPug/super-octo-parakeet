//
//  Connection+HubchatAPITests.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import XCTest
@testable import CodeChallengeCore

class Connection_HubchatAPITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //  MARK : Forum Info
    
    func testThatItGetsForumJSON() {
        
        //  Given
        let completionExpectation = expectation(description: "Connection performs async request")
        
        //  When
        Connection().requestForumInfo() { result in
            
            switch result {
                
            case let .Success(object):
                //  Then
                XCTAssertNotNil(object)
                break
                
            default:
                XCTFail("testThatItGetsForumJSON-error")
                break
            }
            
            completionExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { error in
            
            if let error = error {
                XCTFail("testThatItGetsForumJSON error: \(error)")
            }
        }
    }

}
