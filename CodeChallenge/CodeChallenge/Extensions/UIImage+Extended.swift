//
//  UIImage+Extended.swift
//  CodeChallenge
//
//  Created by Jose Torres on 8/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import UIKit
import PromiseKit

extension UIImageView {
    
    func getImage(url: String) {
        
        Network().getImage(url: url)
            .then { [weak self] image in
                
                self?.image = image
                
            }.catch { error in
                
                dump(error)
        }
    }
    
    func getPromiseImage(url: String) -> Promise<Any?> {
        
        return Promise { fulfill, reject in

            Network().getImage(url: url)
                .then { [weak self] image in

                    self?.image = image

                }.then { _ in

                    fulfill(nil)

                }.catch { error in

                    _ = reject(error)
            }
        }
    }
    
    func applyBur() {
        
        let effect = UIBlurEffect(style: .extraLight)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(effectView)
    }
}
