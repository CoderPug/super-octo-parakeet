//
//  ForumPosts+SwiftyJSON.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import SwiftyJSON

extension ForumPosts {
    
    init?(json: JSON) {
        
        guard let posts = json["posts"].array else {
                
                return nil
        }        
        self.posts = posts.flatMap { ForumPost(json: $0) }
        self.totalCount = json["meta"]["totalCount"].intValue
    }
    
}
