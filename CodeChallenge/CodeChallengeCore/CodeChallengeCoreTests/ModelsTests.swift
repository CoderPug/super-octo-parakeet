//
//  ModelsTests.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import XCTest
import SwiftyJSON

@testable import CodeChallengeCore

class ModelsTests: XCTestCase {
    
    let forumAPIRightJSON = "{\"status\":\"ok\",\"forum\":{\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"updatedAt\":\"2017-01-05T10:47:38.638Z\",\"createdAt\":\"2016-05-19T09:36:04.323Z\",\"slug\":\"photography\",\"title\":\"Photography\",\"description\":\"Share your photos, get inspired & learn about becoming a better photographer!\",\"createdBy\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"owner\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"embedded\":{\"color\":\"auto\",\"allowedUrls\":[]},\"ownerUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"createdByUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"location\":null,\"adIntegrations\":[],\"settings\":{\"allowGuestPosting\":false,\"ignoreQueryString\":false,\"flagAsNsfw\":false,\"whoCanCreateTopics\":\"all_members\",\"whoCanSee\":\"anyone\",\"whoCanJoin\":\"anyone\"},\"blacklistedWords\":[],\"branding\":{\"termsUrl\":null},\"headerImage\":{\"url\":\"https://img.hubchat.com/v1463650610/header/gjudvbxdkuzgnllvuhex.jpg\"},\"image\":{\"crop\":{\"height\":320,\"width\":320,\"y\":64,\"x\":19},\"url\":\"https://img.hubchat.com/v1463650762/forum/qbv3coh6hzekv5vzgk6b.jpg\"},\"timestamp\":1483613258638,\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"bannedCount\":0,\"memberCount\":333,\"moderators\":[\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\"],\"channels\":[],\"postCount\":64,\"flaggedCount\":0,\"joinRequestCount\":0}}"
    let forumAPIWrongJSON = "{\"status\":\"ok\",\"forum\":{\"updatedAt\":\"2017-01-05T10:47:38.638Z\",\"createdAt\":\"2016-05-19T09:36:04.323Z\",\"slug\":\"photography\",\"title\":\"Photography\",\"description\":\"Share your photos, get inspired & learn about becoming a better photographer!\",\"createdBy\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"owner\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"embedded\":{\"color\":\"auto\",\"allowedUrls\":[]},\"ownerUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"createdByUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"location\":null,\"adIntegrations\":[],\"settings\":{\"allowGuestPosting\":false,\"ignoreQueryString\":false,\"flagAsNsfw\":false,\"whoCanCreateTopics\":\"all_members\",\"whoCanSee\":\"anyone\",\"whoCanJoin\":\"anyone\"},\"blacklistedWords\":[],\"branding\":{\"termsUrl\":null},\"headerImage\":{\"url\":\"https://img.hubchat.com/v1463650610/header/gjudvbxdkuzgnllvuhex.jpg\"},\"image\":{\"crop\":{\"height\":320,\"width\":320,\"y\":64,\"x\":19},\"url\":\"https://img.hubchat.com/v1463650762/forum/qbv3coh6hzekv5vzgk6b.jpg\"},\"timestamp\":1483613258638,\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"bannedCount\":0,\"memberCount\":333,\"moderators\":[\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\"],\"channels\":[],\"postCount\":64,\"flaggedCount\":0,\"joinRequestCount\":0}}"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //  MARK: - Forum
    
    func testThatItGetsForumObjectFromJSON() {
        
        //  Given
        guard let forumData = forumAPIRightJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItGetsForumObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumData)
        
        //  When
        let forum = Forum(json: forumJSON)
        
        //  Then
        XCTAssertNotNil(forum)
    }
    
    func testThatItFailsToGetForumObjectFromJSON() {
        
        //  Given
        guard let forumData = forumAPIWrongJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItFailsToGetForumObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumData)
        
        //  When
        let forum = Forum(json: forumJSON)
        
        //  Then
        XCTAssertNil(forum)
    }
}
