//
//  ForumPostsViewController.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit
import SnapKit
import CodeChallengeCore

class ForumPostsViewController: UIViewController {

    static let flowLayout = UICollectionViewFlowLayout()
    var viewForumHeader: ForumHeaderView = ForumHeaderView()
    var collectionViewPosts: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    var posts: [ForumPost] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customize()
        requestForumInfo()
        requestForumPosts()
    }
    
    //  MARK: Private
    
    private func customize() {
        
        appareance()
        layout()
    }
    
    private func layout() {
        
        //  viewForumHeader
        view.addSubview(viewForumHeader)
        
        viewForumHeader.snp.makeConstraints { make in
            
            make.trailing.equalTo(0)
            make.height.equalTo(ForumPostsViewController.viewForumHeaderHeight)
            make.width.equalToSuperview()
        }
        
        //  collectionViewPosts
        collectionViewPosts.delegate = self
        collectionViewPosts.dataSource = self
        collectionViewPosts.register(ForumView.self, forCellWithReuseIdentifier: ForumView.cellIdentifier)
        collectionViewPosts.showsVerticalScrollIndicator = false
        collectionViewPosts.showsHorizontalScrollIndicator = false
        
        view.addSubview(collectionViewPosts)
        
        collectionViewPosts.snp.makeConstraints { make in
            
            make.trailing.equalTo(0)
            make.top.equalTo(viewForumHeader.snp.bottom)
            make.height.equalTo(self.view.frame.height - ForumPostsViewController.viewForumHeaderHeight)
            make.width.equalToSuperview()
        }
    }
    
    private func appareance() {
        
        view.backgroundColor = Appearance.Colors.empty
        collectionViewPosts.backgroundColor = Appearance.Colors.empty
    }
    
}

extension ForumPostsViewController {
    
    static let viewForumHeaderHeight: CGFloat = 100

}
