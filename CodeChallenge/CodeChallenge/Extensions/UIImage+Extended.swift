//
//  UIImage+Extended.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func getImage(url: String) {
        
        Network().getImage(url: url)
            .then { [weak self] image in
                
                self?.image = image
                
            }.catch { error in
                
                dump(error)
        }
    }
}
