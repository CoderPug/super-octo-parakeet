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
    
    var imageUserAvatar: UIImageView = UIImageView()
    var imageForum: UIImageView = UIImageView()
    var labelUserName: UILabel = UILabel()
    var labelForumText: UILabel = UILabel()
    var labelImagesCounter: UILabel = UILabel()
    
    override func layoutSubviews() {
        
        customize()
    }
    
    override func prepareForReuse() {
        
        labelImagesCounter.text = ""
        imageForum.image = nil
    }
    
    //  MARK: Private
    
    private func customize() {
        
        appareance()
        layout()
        
        labelForumText.numberOfLines = 2
        imageForum.contentMode = .scaleAspectFit
        imageForum.clipsToBounds = true
    }
    
    private func layout() {
        
        //  imageUserAvatar
        addSubview(imageUserAvatar)
        
        imageUserAvatar.snp.makeConstraints { make in
            
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.leading.equalTo(10)
            make.topMargin.equalTo(10)
        }
        
        //  imageUsername
        addSubview(labelUserName)
        
        labelUserName.snp.makeConstraints { make in
            
            make.topMargin.equalTo(10)
            make.leading.equalTo(imageUserAvatar.snp.trailing).offset(10)
        }
        
        //  forumText
        addSubview(labelForumText)
        
        labelForumText.snp.makeConstraints { make in
            
            make.trailing.equalTo(10)
            make.leading.equalTo(10)
            make.topMargin.equalTo(50)
        }
        
        //  forumImage
        addSubview(imageForum)
        
        imageForum.snp.makeConstraints { make in
            
            make.topMargin.equalTo(labelForumText.snp.bottom).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(self.frame.size.width / 16 * 12)
        }
        
        //  labelImagesCounter
        addSubview(labelImagesCounter)
        
        labelImagesCounter.snp.makeConstraints { make in
        
            make.trailing.equalTo(imageForum.snp.trailing).inset(5)
            make.bottom.equalTo(imageForum.snp.bottom).inset(5)
        }
    }
    
    private func appareance() {
        
        backgroundColor = UIColor.white
        labelImagesCounter.font = Appearance.Fonts.h4
        labelImagesCounter.textColor = UIColor.white
        labelUserName.font = Appearance.Fonts.h3
        labelUserName.textColor = Appearance.Colors.second
        labelForumText.font = Appearance.Fonts.text
        labelForumText.textColor = Appearance.Colors.second
        imageForum.backgroundColor = UIColor.black
    }
    
}

extension ForumView {
    
    static let cellIdentifier = "forumViewCell"
}