//
//  Appearance.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import UIKit

struct Appearance {
    
    struct Colors {
        
        static let first = UIColor.init(colorLiteralRed: 45.0/255.0, green: 122.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        static let second = UIColor.init(colorLiteralRed: 8.0/255.0, green: 28.0/255.0, blue: 36.0/255.0, alpha: 1.0)
        static let third = UIColor.init(colorLiteralRed: 51.0/255.0, green: 51.0/255.0, blue: 51.0/255.0, alpha: 1.0)
        static let empty = UIColor.init(colorLiteralRed: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
    }
    
    struct Fonts {
        
        static let h1 = UIFont.systemFont(ofSize: 18.0, weight: UIFontWeightHeavy)
        static let h2 = UIFont.systemFont(ofSize: 16.0, weight: UIFontWeightMedium)
        static let h3 = UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightMedium)
        static let h4 = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightMedium)
        static let text = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular)
        static let detailText = UIFont.systemFont(ofSize: 12.0, weight: UIFontWeightLight)
    }
    
}

func globalAppearance() {
    
    let navigationBarAppearace = UINavigationBar.appearance()
    navigationBarAppearace.tintColor = Appearance.Colors.first
    navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName: Appearance.Colors.first,
                                                  NSFontAttributeName: Appearance.Fonts.h1]
}
