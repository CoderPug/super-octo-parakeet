//
//  Connection+HubchatAPI.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import SwiftyJSON

/// HubchatAPI constants structs
struct HubchatAPI {
    
    static let server = "https://api.hubchat.com/"
    static let version = "v1"
    static let forumPhotographyURL = server + version + "/forum/photography"
    static let forumPhotographyPostsURL = server + version + "/forum/photography/post"
}

extension Connection {
        
    /// Request HubchatAPI photography forum information.
    ///
    /// - Parameter completion: Completion closure.
    public func requestForumInfo(completion: @escaping (Result<Forum>) -> Void) {

        requestJSON(url: HubchatAPI.forumPhotographyURL, completion: completion)
    }
    
    /// Request HubchatAPI photography forum posts.
    ///
    /// - Parameter completion: Completion closure.
    public func requestForumPosts(completion: @escaping (Result<ForumPosts>) -> Void) {
        
        requestJSON(url: HubchatAPI.forumPhotographyPostsURL, completion: completion)
    }
    
    /// Request image resource.
    ///
    /// - Parameters:
    ///   - url: String image URL.
    ///   - completion: Completion closure.
    public func requestImage(url: String, completion: @escaping (Result<UIImage>) -> Void) {
        
        requestImageResource(url: url, completion: completion)
    }

}

