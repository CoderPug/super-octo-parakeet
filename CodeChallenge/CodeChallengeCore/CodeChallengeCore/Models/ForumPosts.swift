//
//  ForumPosts.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct ForumPosts: ConnectionParseable {
    
    let posts: [ForumPost]
    let totalCount: Int?
}
