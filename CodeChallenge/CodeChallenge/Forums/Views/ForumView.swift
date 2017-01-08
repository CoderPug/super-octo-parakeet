//
//  ForumView.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import SnapKit

final class ForumView: UICollectionViewCell {
    
    var forumImage: UIImageView = UIImageView()
    var forumText: UILabel = UILabel()
    
    override func layoutSubviews() {
        
        customize()
    }
    
    //  MARK: Private
    
    private func customize() {
        
        appareance()
        layout()
        
        forumImage.contentMode = .scaleAspectFit
        forumImage.clipsToBounds = true
    }
    
    private func layout() {
        
        //  forumImage
        addSubview(forumImage)
        
        forumImage.snp.makeConstraints { make in
            
            make.topMargin.equalTo(70)
            make.width.equalToSuperview()
            make.height.equalTo(self.frame.size.width / 16 * 12)
        }
        
        //  forumText
        addSubview(forumText)
        
        forumText.snp.makeConstraints { make in
            
            make.width.equalToSuperview()
            make.topMargin.equalTo(10)
        }
    }
    
    private func appareance() {
        
        backgroundColor = UIColor.white
        forumText.font = Appearance.Fonts.h3
        forumText.textColor = Appearance.Colors.second
        forumImage.backgroundColor = UIColor.black
    }
    
}

extension ForumView {
    
    static let cellIdentifier = "forumViewCell"
}
