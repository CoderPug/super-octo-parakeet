//
//  Forum.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation

public struct Forum: ConnectionParseable {
    
    public let id: String
    public let title: String
    public let description: String
    public let headerImageURL: String?
    public let postsCount: Int?
    public let memberCount: Int?
    public let createdAt: Date?
    public let updatedAt: Date?
}
