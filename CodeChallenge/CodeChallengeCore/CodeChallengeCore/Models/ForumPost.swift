//
//  ForumPost.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct ForumPost: ConnectionParseable {
    
    public let id: String
    public let text: String
    public let userAvatarURL: String?
    public let userUsername: String?
    public let imageURLs: [String]?
    public let upVotes: Int
}
