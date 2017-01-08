//
//  ForumPost.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct ForumPost: ConnectionParseable {
    
    let id: String
    let text: String
    let userAvatarURL: String?
    let userUsername: String?
    let imageURLs: [String]?
    let upVotes: Int
}
