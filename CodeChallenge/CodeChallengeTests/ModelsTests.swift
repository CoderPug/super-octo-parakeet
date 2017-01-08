//
//  ModelsTests.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import CodeChallenge

class ModelsTests: XCTestCase {
    
    let forumRightJSON = "{\"status\":\"ok\",\"forum\":{\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"updatedAt\":\"2017-01-05T10:47:38.638Z\",\"createdAt\":\"2016-05-19T09:36:04.323Z\",\"slug\":\"photography\",\"title\":\"Photography\",\"description\":\"Share your photos, get inspired & learn about becoming a better photographer!\",\"createdBy\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"owner\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"embedded\":{\"color\":\"auto\",\"allowedUrls\":[]},\"ownerUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"createdByUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"location\":null,\"adIntegrations\":[],\"settings\":{\"allowGuestPosting\":false,\"ignoreQueryString\":false,\"flagAsNsfw\":false,\"whoCanCreateTopics\":\"all_members\",\"whoCanSee\":\"anyone\",\"whoCanJoin\":\"anyone\"},\"blacklistedWords\":[],\"branding\":{\"termsUrl\":null},\"headerImage\":{\"url\":\"https://img.hubchat.com/v1463650610/header/gjudvbxdkuzgnllvuhex.jpg\"},\"image\":{\"crop\":{\"height\":320,\"width\":320,\"y\":64,\"x\":19},\"url\":\"https://img.hubchat.com/v1463650762/forum/qbv3coh6hzekv5vzgk6b.jpg\"},\"timestamp\":1483613258638,\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"bannedCount\":0,\"memberCount\":333,\"moderators\":[\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\"],\"channels\":[],\"postCount\":64,\"flaggedCount\":0,\"joinRequestCount\":0}}"
    let forumWrongJSON = "{\"status\":\"ok\",\"forum\":{\"updatedAt\":\"2017-01-05T10:47:38.638Z\",\"createdAt\":\"2016-05-19T09:36:04.323Z\",\"slug\":\"photography\",\"title\":\"Photography\",\"description\":\"Share your photos, get inspired & learn about becoming a better photographer!\",\"createdBy\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"owner\":{\"id\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"uuid\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"avatar\":{\"url\":\"https://img.hubchat.com/v1476803175/avatar/ctciwftbobn2j5qluoy4.jpg\",\"crop\":{\"x\":0,\"y\":22,\"width\":402,\"height\":402}},\"familyName\":\"Kuisma\",\"givenName\":\"Kimmo\",\"displayName\":\"KimmoK\",\"username\":\"KimmoK\",\"description\":\"Photography, music & physical fitness. Living in Helsinki, Finland.\"},\"embedded\":{\"color\":\"auto\",\"allowedUrls\":[]},\"ownerUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"createdByUUID\":\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\",\"location\":null,\"adIntegrations\":[],\"settings\":{\"allowGuestPosting\":false,\"ignoreQueryString\":false,\"flagAsNsfw\":false,\"whoCanCreateTopics\":\"all_members\",\"whoCanSee\":\"anyone\",\"whoCanJoin\":\"anyone\"},\"blacklistedWords\":[],\"branding\":{\"termsUrl\":null},\"headerImage\":{\"url\":\"https://img.hubchat.com/v1463650610/header/gjudvbxdkuzgnllvuhex.jpg\"},\"image\":{\"crop\":{\"height\":320,\"width\":320,\"y\":64,\"x\":19},\"url\":\"https://img.hubchat.com/v1463650762/forum/qbv3coh6hzekv5vzgk6b.jpg\"},\"timestamp\":1483613258638,\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"bannedCount\":0,\"memberCount\":333,\"moderators\":[\"b41a8ca47804-d069-6422-8bf2-6988aef0e828\"],\"channels\":[],\"postCount\":64,\"flaggedCount\":0,\"joinRequestCount\":0}}"
    let forumPostRightJSON = "{\"rawContent\":\"Taken at Lux exhibition, Helsinki\",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"uuid\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"avatar\":{\"crop\":{\"height\":384,\"width\":384,\"y\":0,\"x\":41},\"url\":\"https://img.hubchat.com/v1449321239/avatar/nzvyaxtbkbwwzms56szk.jpg\"},\"familyName\":\"Mairh\",\"givenName\":\"Ujjwal\",\"displayName\":\"nish\",\"username\":\"nish\"},\"createdByUUID\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4356.7434147,\"controversyScore\":0,\"wilsonScore\":0.8589313179093836},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":369296,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552212/post/ivbcmci8usbmfwoes7ps.jpg\",\"width\":1920,\"height\":1440},{\"size\":568056,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552216/post/jesnonc8wfh2itaqqza9.jpg\",\"width\":1920,\"height\":1440},{\"size\":41866,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552219/post/fbpucb4juvdz1qyofbg4.jpg\",\"width\":900,\"height\":1200},{\"size\":12178,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552221/post/qs2jyconlr5bpiqq380t.jpg\",\"width\":900,\"height\":1200},{\"size\":118788,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552222/post/pe85ycr6mskrvpgskkrq.jpg\",\"width\":1920,\"height\":1440},{\"size\":105136,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552225/post/rzr2iwzh6tic8vl1kb2i.jpg\",\"width\":1920,\"height\":1440},{\"size\":116506,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552227/post/euosvi3uzggnczfacnra.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":10},\"uuid\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"updatedAt\":\"2017-01-06T21:49:33.208Z\",\"createdAt\":\"2017-01-04T17:50:31.030Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"timestamp\":1483739373208,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false}"
    let forumPostWrongJSON = "{\"rawContent\":\"Taken at Lux exhibition, Helsinki\",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"uuid\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"avatar\":{\"crop\":{\"height\":384,\"width\":384,\"y\":0,\"x\":41},\"url\":\"https://img.hubchat.com/v1449321239/avatar/nzvyaxtbkbwwzms56szk.jpg\"},\"familyName\":\"Mairh\",\"givenName\":\"Ujjwal\",\"displayName\":\"nish\",\"username\":\"nish\"},\"createdByUUID\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4356.7434147,\"controversyScore\":0,\"wilsonScore\":0.8589313179093836},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":369296,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552212/post/ivbcmci8usbmfwoes7ps.jpg\",\"width\":1920,\"height\":1440},{\"size\":568056,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552216/post/jesnonc8wfh2itaqqza9.jpg\",\"width\":1920,\"height\":1440},{\"size\":41866,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552219/post/fbpucb4juvdz1qyofbg4.jpg\",\"width\":900,\"height\":1200},{\"size\":12178,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552221/post/qs2jyconlr5bpiqq380t.jpg\",\"width\":900,\"height\":1200},{\"size\":118788,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552222/post/pe85ycr6mskrvpgskkrq.jpg\",\"width\":1920,\"height\":1440},{\"size\":105136,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552225/post/rzr2iwzh6tic8vl1kb2i.jpg\",\"width\":1920,\"height\":1440},{\"size\":116506,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552227/post/euosvi3uzggnczfacnra.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":10},\"updatedAt\":\"2017-01-06T21:49:33.208Z\",\"createdAt\":\"2017-01-04T17:50:31.030Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"timestamp\":1483739373208,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false}"
    let forumPostsRightJSON = "{\"status\":\"ok\",\"posts\":[{\"rawContent\":\"Taken at Lux exhibition, Helsinki\",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"uuid\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"avatar\":{\"crop\":{\"height\":384,\"width\":384,\"y\":0,\"x\":41},\"url\":\"https://img.hubchat.com/v1449321239/avatar/nzvyaxtbkbwwzms56szk.jpg\"},\"familyName\":\"Mairh\",\"givenName\":\"Ujjwal\",\"displayName\":\"nish\",\"username\":\"nish\"},\"createdByUUID\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4356.7434147,\"controversyScore\":0,\"wilsonScore\":0.8589313179093836},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":369296,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552212/post/ivbcmci8usbmfwoes7ps.jpg\",\"width\":1920,\"height\":1440},{\"size\":568056,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552216/post/jesnonc8wfh2itaqqza9.jpg\",\"width\":1920,\"height\":1440},{\"size\":41866,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552219/post/fbpucb4juvdz1qyofbg4.jpg\",\"width\":900,\"height\":1200},{\"size\":12178,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552221/post/qs2jyconlr5bpiqq380t.jpg\",\"width\":900,\"height\":1200},{\"size\":118788,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552222/post/pe85ycr6mskrvpgskkrq.jpg\",\"width\":1920,\"height\":1440},{\"size\":105136,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552225/post/rzr2iwzh6tic8vl1kb2i.jpg\",\"width\":1920,\"height\":1440},{\"size\":116506,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552227/post/euosvi3uzggnczfacnra.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":10},\"uuid\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"updatedAt\":\"2017-01-06T21:49:33.208Z\",\"createdAt\":\"2017-01-04T17:50:31.030Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"timestamp\":1483739373208,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false},{\"rawContent\":\"What an amazing view from our balcony today. \",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"uuid\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"avatar\":{\"crop\":{},\"url\":\"https://graph.facebook.com/v2.2/1416848688/picture\"},\"familyName\":\"Org\",\"givenName\":\"Liis \",\"displayName\":\"fitliis\",\"username\":\"fitliis\",\"deletedAt\":null,\"description\":\"IFBB Body Fitness competitor\"},\"createdByUUID\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4357.1487228,\"controversyScore\":0,\"wilsonScore\":0.7527428728792092},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":155090,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483613254/post/uxanbrfqv10hdsmg3hri.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":5},\"uuid\":\"ae76ee308219-837e-d9f8-74a5-96ce3aff8af1\",\"updatedAt\":\"2017-01-06T17:16:17.370Z\",\"createdAt\":\"2017-01-05T10:47:38.638Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"ae76ee308219-837e-d9f8-74a5-96ce3aff8af1\",\"timestamp\":1483722977370,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false}],\"meta\":{\"count\":64,\"totalCount\":64}}"
    let forumPostsWrongJSON = "{\"status\":\"ok\",\"posts2\":[{\"rawContent\":\"Taken at Lux exhibition, Helsinki\",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"uuid\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"avatar\":{\"crop\":{\"height\":384,\"width\":384,\"y\":0,\"x\":41},\"url\":\"https://img.hubchat.com/v1449321239/avatar/nzvyaxtbkbwwzms56szk.jpg\"},\"familyName\":\"Mairh\",\"givenName\":\"Ujjwal\",\"displayName\":\"nish\",\"username\":\"nish\"},\"createdByUUID\":\"f7782757f577-0df4-fa60-d916-90557e3fa0c7\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4356.7434147,\"controversyScore\":0,\"wilsonScore\":0.8589313179093836},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":369296,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552212/post/ivbcmci8usbmfwoes7ps.jpg\",\"width\":1920,\"height\":1440},{\"size\":568056,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552216/post/jesnonc8wfh2itaqqza9.jpg\",\"width\":1920,\"height\":1440},{\"size\":41866,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552219/post/fbpucb4juvdz1qyofbg4.jpg\",\"width\":900,\"height\":1200},{\"size\":12178,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552221/post/qs2jyconlr5bpiqq380t.jpg\",\"width\":900,\"height\":1200},{\"size\":118788,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552222/post/pe85ycr6mskrvpgskkrq.jpg\",\"width\":1920,\"height\":1440},{\"size\":105136,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552225/post/rzr2iwzh6tic8vl1kb2i.jpg\",\"width\":1920,\"height\":1440},{\"size\":116506,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483552227/post/euosvi3uzggnczfacnra.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":10},\"uuid\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"updatedAt\":\"2017-01-06T21:49:33.208Z\",\"createdAt\":\"2017-01-04T17:50:31.030Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"1ea44135c165-1d94-6a78-a705-c26ad2d04cf8\",\"timestamp\":1483739373208,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false},{\"rawContent\":\"What an amazing view from our balcony today. \",\"title\":null,\"forum\":{\"id\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"uuid\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"slug\":\"photography\",\"title\":\"Photography\"},\"forumUUID\":\"a7cc1d600d6a-c7a1-d0de-aa4f-0168398bbc1d\",\"channelUUID\":null,\"createdBy\":{\"id\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"uuid\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"avatar\":{\"crop\":{},\"url\":\"https://graph.facebook.com/v2.2/1416848688/picture\"},\"familyName\":\"Org\",\"givenName\":\"Liis \",\"displayName\":\"fitliis\",\"username\":\"fitliis\",\"deletedAt\":null,\"description\":\"IFBB Body Fitness competitor\"},\"createdByUUID\":\"42a0838ce07c-8178-af52-e4da-21e7fa38dd63\",\"guestUserAlias\":null,\"flags\":{\"isWaitingForApproval\":false,\"isLocked\":false,\"isSticky\":false,\"isFeatured\":false,\"isFlagged\":false},\"cache\":{\"totalTopLevelComments\":0,\"totalComments\":0},\"sort\":{\"totalCommentsHotScore\":0,\"hotScore\":4357.1487228,\"controversyScore\":0,\"wilsonScore\":0.7527428728792092},\"entities\":{\"mentions\":[],\"links\":[],\"images\":[{\"size\":155090,\"type\":\"image/jpeg\",\"cdnUrl\":\"http://img.hubchat.com/v1483613254/post/uxanbrfqv10hdsmg3hri.jpg\",\"width\":1920,\"height\":1440}],\"videos\":[],\"files\":[]},\"stats\":{\"negativity\":0,\"downVotes\":0,\"upVotes\":5},\"uuid\":\"ae76ee308219-837e-d9f8-74a5-96ce3aff8af1\",\"updatedAt\":\"2017-01-06T17:16:17.370Z\",\"createdAt\":\"2017-01-05T10:47:38.638Z\",\"location\":null,\"images\":[],\"links\":[],\"id\":\"ae76ee308219-837e-d9f8-74a5-96ce3aff8af1\",\"timestamp\":1483722977370,\"isDeleted\":false,\"isSeen\":true,\"hasUpVote\":false}],\"meta\":{\"count\":64,\"totalCount\":64}}"
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    //  MARK: - Forum
    
    func testThatItGetsForumObjectFromJSON() {
        
        //  Given
        guard let forumData = forumRightJSON.data(using: String.Encoding.utf8) else {
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
        guard let forumData = forumWrongJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItFailsToGetForumObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumData)
        
        //  When
        let forum = Forum(json: forumJSON)
        
        //  Then
        XCTAssertNil(forum)
    }
    
    //  MARK: - ForumPost
    
    func testThatItGetsForumPostObjectFromJSON() {
        
        //  Given
        guard let forumPostData = forumPostRightJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItGetsForumPostObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumPostData)
        
        //  When
        let forumPost = ForumPost(json: forumJSON)
        
        //  Then
        XCTAssertNotNil(forumPost)
    }
    
    func testThatItFailsToGetForumPostObjectFromJSON() {
        
        //  Given
        guard let forumPostData = forumPostWrongJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItFailsToGetForumPostObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumPostData)
        
        //  When
        let forumPost = ForumPost(json: forumJSON)
        
        //  Then
        XCTAssertNil(forumPost)
    }
    
    //  MARK: - ForumPosts
    
    func testThatItGetsForumPostsObjectFromJSON() {
        
        //  Given
        guard let forumPostData = forumPostsRightJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItGetsForumPostObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumPostData)
        
        //  When
        let forumPosts = ForumPosts(json: forumJSON)
        
        //  Then
        XCTAssertNotNil(forumPosts)
    }
    
    func testThatItFailsToGetForumPostsObjectFromJSON() {
        
        //  Given
        guard let forumPostData = forumPostsWrongJSON.data(using: String.Encoding.utf8) else {
            XCTFail("testThatItFailsToGetForumPostObjectFromJSON error")
            return
        }
        
        let forumJSON = JSON(data: forumPostData)
        
        //  When
        let forumPosts = ForumPosts(json: forumJSON)
        
        //  Then
        XCTAssertNil(forumPosts)
    }
    
}
