//
//  CodeChallengeCoreTests.swift
//  CodeChallengeCoreTests
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import XCTest
@testable import CodeChallengeCore

class CodeChallengeCoreTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatItGetsJSONFromCorrectURL() {
        
        //  Given
        let url = "https://api.hubchat.com/v1/forum/photography"
        
        let completionExpectation = expectation(description: "Connection performs async request")
        
        //  When
        Connection().requestJSON(url: url) { result in
            
            switch result {
                
            case let .Success(object):
                //  Then
                XCTAssertNotNil(object)
                XCTAssert((object as? [String: AnyObject]) != nil)
                break

            default:
                XCTFail("testThatItGetsJSONFromCorrectURL-error")
                break
            }
            
            completionExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { error in
            
            if let error = error {
                XCTFail("testThatItGetsJSONFromCorrectURL error: \(error)")
            }
        }
    }
    
    func testThatItGetsJSONParsingErrorFromWrongURL() {
        
        //  Given
        let url = "https://www.hubchat.com/"
        
        let completionExpectation = expectation(description: "Connection performs async request")
        
        //  When
        Connection().requestJSON(url: url) { result in
            
            switch result {
                
            case let .Failure(error):
                //  Then
                XCTAssertNotNil(error)
                XCTAssert(error as? ConnectionError == ConnectionError.responseNotJSON)
                
            default:
                XCTFail("testThatItGetsJSONParsingErrorFromWrongURL-error")
                break
            }
            
            completionExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5.0) { error in
            
            if let error = error {
                XCTFail("testThatItGetsJSONParsingErrorFromWrongURL error: \(error)")
            }
        }
    }

}
