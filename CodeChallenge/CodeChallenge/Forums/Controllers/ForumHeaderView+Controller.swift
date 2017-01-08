//
//  ForumHeaderView+Controller.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import CodeChallengeCore

extension ForumHeaderView {
    
    //  MARK: Public
    
    func load(forum: Forum) {
        
        labelTitle.text = forum.title
    }
}
