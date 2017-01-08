//
//  ForumPostsViewControllerExtended.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit
import CodeChallengeCore

extension ForumPostsViewController {
    
    func requestForumInfo() {
        
        viewForumHeader.progressView.startAnimating()
        
        Network().getForumInfo()
            .then { [weak self] forum in
                
                self?.viewForumHeader.load(forum)
                
            }.catch { error in
                
                dump(error)
        }
    }
    
    func requestForumPosts() {
        
        Network().getForumPosts()
            .then { [weak self] posts in
                
                self?.posts = posts
                
            }.then { [weak self] posts in
                
                self?.collectionViewPosts.reloadData()
                
            }.catch { error in
                
                dump(error)
        }
    }
    
}
