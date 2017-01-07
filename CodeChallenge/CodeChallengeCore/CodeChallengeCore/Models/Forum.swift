//
//  Forum.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct Forum: ConnectionParseable {
    
    let id: String
    let title: String
    let description: String
    let headerImageURL: String?
    let postsCount: Int?
    let memberCount: Int?
    let createdAt: Date?
    let updatedAt: Date?
}
