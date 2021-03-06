//
//  ForumHeaderView.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit
import SnapKit

final class ForumHeaderView: UIView {
    
    var imageBackground: UIImageView = UIImageView()
    var labelTitle: UILabel = UILabel()
    var labelDescription: UILabel = UILabel()
    var progressView: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func layoutSubviews() {
        
        customize()
    }
    
    //  MARK: Private
    
    private func customize() {
     
        appareance()
        layout()
        
        labelDescription.numberOfLines = 2
        imageBackground.contentMode = .scaleAspectFill
        imageBackground.clipsToBounds = true
    }
    
    private func layout() {
        
        //  progressView
        addSubview(progressView)
        
        progressView.snp.makeConstraints { make in
            
            make.center.equalToSuperview()
        }
        
        //  imageBackground
        addSubview(imageBackground)
        
        imageBackground.snp.makeConstraints { make in
            
            make.size.equalToSuperview()
        }
        
        //  labelTitle
        addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            
            make.left.equalTo(20)
            make.right.equalToSuperview().inset(20)
            make.topMargin.equalTo(40)
        }
        
        //  labelDescription
        addSubview(labelDescription)
        
        labelDescription.snp.makeConstraints { make in
            
            make.left.equalTo(20)
            make.right.equalToSuperview().inset(20)
            make.topMargin.equalTo(60)
        }
    }
    
    private func appareance() {
        
        backgroundColor = UIColor.white
        labelTitle.font = Appearance.Fonts.h1
        labelTitle.textColor = Appearance.Colors.first
        labelDescription.font = Appearance.Fonts.detailText
        labelDescription.textColor = Appearance.Colors.first
    }
    
 }
