//
//  Forum+SwiftyJSON.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Forum {
    
    init?(json: JSON) {
        
        guard let id = json["forum"]["uuid"].string,
            let title = json["forum"]["title"].string,
            let description = json["forum"]["description"].string else {
                
                return nil
        }
        self.id = id
        self.title = title
        self.description = description
        self.headerImageURL = json["forum"]["headerImage"]["url"].stringValue
        self.postsCount = json["forum"]["postCount"].intValue
        self.memberCount = json["forum"]["memberCount"].intValue
        self.createdAt = nil
        self.updatedAt = nil  //updatedAt createdAt
    }
}
