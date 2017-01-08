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
        collectionViewPosts.register(ForumView.self, forCellWithReuseIdentifier: "Cell")
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

extension ForumPostsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let forumPost = posts[indexPath.row]
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ForumView else {
            
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
        
        return CGSize(width: self.view.frame.size.width,
                      height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5,
                            left: 0,
                            bottom: 0,
                            right: 5)
    }
    
}
