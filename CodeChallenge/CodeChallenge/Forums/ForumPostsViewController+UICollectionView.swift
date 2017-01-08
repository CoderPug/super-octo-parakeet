//
//  ForumPostsViewController+UICollectionView.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit

extension ForumPostsViewController {
    
    static let flowLayoutMaxWidth: CGFloat = 350
    static let flowLayoutEdgeTop: CGFloat = 10
    static let flowLayoutEdgeBottom: CGFloat = 10
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
        
        postWidth = min(self.view.frame.size.width, ForumPostsViewController.flowLayoutMaxWidth)
        
        return CGSize(width: postWidth ?? self.view.frame.size.width,
                      height: (postWidth ?? self.view.frame.size.width) / 16 * 12 + 70 + 50)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let horizontalSpan = (self.view.frame.size.width - (postWidth ?? self.view.frame.size.width) * 2) / 4
        
        return UIEdgeInsets(top: ForumPostsViewController.flowLayoutEdgeTop,
                            left: horizontalSpan,
                            bottom: ForumPostsViewController.flowLayoutEdgeBottom,
                            right: horizontalSpan)
    }
    
}
