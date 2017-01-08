//
//  ForumPostsViewController+UICollectionView.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit

extension ForumPostsViewController {
    
    static let flowLayoutMaxWidth: CGFloat = 400
    static let flowLayoutMaxHeight: CGFloat = ForumPostsViewController.flowLayoutMaxHeight * 16 / 9
    static let flowLayoutEdgeTop: CGFloat = 5
    static let flowLayoutEdgeBottom: CGFloat = 5
    static let flowLayoutEdgeSides: CGFloat = 0
}

extension ForumPostsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let forumPost = posts[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForumView.cellIdentifier, for: indexPath) as? ForumView else {
            
            return UICollectionViewCell()
        }
        
        cell.load(forumPost)
        
        return cell
    }
    
}

extension ForumPostsViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: min(self.view.frame.size.width, ForumPostsViewController.flowLayoutMaxWidth),
                      height: min(self.view.frame.size.width / 16 * 9, ForumPostsViewController.flowLayoutMaxWidth))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: ForumPostsViewController.flowLayoutEdgeTop,
                            left: ForumPostsViewController.flowLayoutEdgeSides,
                            bottom: ForumPostsViewController.flowLayoutEdgeBottom,
                            right: ForumPostsViewController.flowLayoutEdgeSides)
    }
    
}
