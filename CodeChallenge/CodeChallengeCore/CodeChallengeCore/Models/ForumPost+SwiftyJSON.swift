//
//  ForumPost+SwiftyJSON.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import SwiftyJSON

extension ForumPost {
    
    init?(json: JSON) {
        
        guard let id = json["uuid"].string,
            let userAvatarURL = json["createdBy"]["avatar"]["url"].string,
            let userUsername = json["createdBy"]["username"].string,
            let images = json["entities"]["images"].arrayObject as? [[String: AnyObject]] else {
                
                return nil
        }
        self.id = id
        self.text = json["rawContent"].stringValue
        self.userAvatarURL = userAvatarURL
        self.userUsername = userUsername
        self.upVotes = json["stats"]["upVotes"].intValue
        self.imageURLs = images.flatMap { $0["cdnUrl"] as? String }
    }
    
}
