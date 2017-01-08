//
//  ForumView+Controller.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import CodeChallengeCore

extension ForumView {
    
    //  MARK: Public
    
    func load(_ forum: ForumPost) {
        
        forumText.text = forum.text
        forumImage.getImage(url: forum.imageURLs?.first ?? "")
    }
    
}
