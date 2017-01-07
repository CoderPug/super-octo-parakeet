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
    static let ForumPhotographyURL = server + version + "/forum/photography"
    static let ForumPhotographyPostsURL = server + version + "/forum/photography/post"    
}

extension Connection {
        
    /// Request HubchatAPI photography forum information.
    ///
    /// - Parameter completion: Completion closure.
    public func requestForumInfo(completion: @escaping (Result<Forum>) -> Void) {

        requestJSON(url: HubchatAPI.ForumPhotographyURL, completion: completion)
    }
    
    /// Request HubchatAPI photography forum posts.
    ///
    /// - Parameter completion: Completion closure.
    public func requestForumPosts(completion: @escaping (Result<[String: AnyObject]>) -> Void) {
        
        requestJSON(url: HubchatAPI.ForumPhotographyPostsURL) { result in
            
            switch result {
                
            case let .Failure(error):
                
                return completion(.Failure(error))
                
            case let .Success(object):
                
                guard let object = object as? [String: AnyObject] else {
                    
                    return completion(.Failure(ConnectionError.responseNotJSON))
                }
                
                completion(.Success(object))
                break
            }
        }
    }

}

