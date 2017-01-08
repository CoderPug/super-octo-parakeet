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
        
        labelForumText.text = forum.text
        labelUserName.text = forum.userUsername
        imageForum.getImage(url: forum.imageURLs?.first ?? "")
        imageUserAvatar.getImage(url: forum.userAvatarURL)
        
        if let totalPhotos = forum.imageURLs?.count,
            totalPhotos > 1 {
            labelImagesCounter.text = "\(totalPhotos - 1) more"
        }
    }
    
}
