//
//  ForumPost.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct ForumPost: ConnectionParseable {
    
    let id: String //uuid
    let text: String //rawContent
    let userAvatarURL: String? // createdBy.avatar.url
    let userUsername: String? // createdBy.username
    let imageURLs: [String]? // entities.images.cdnUrl
    let upVotes: Int  //stats.upVotes
}
