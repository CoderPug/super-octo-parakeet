//
//  ForumHeaderView+Controller.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import CodeChallengeCore
import PromiseKit

extension ForumHeaderView {
    
    //  MARK: Public
    
    func load(_ forum: Forum) {
        
        labelTitle.text = forum.title
        if let url = forum.headerImageURL {
            
            imageBackground.getPromiseImage(url: url)
                .then { [weak self] _ in
                    
                    self?.progressView.stopAnimating()
                    
                }.catch { error in
                    
                    dump(error)
            }
        }
    }
    
}
