//
//  NetworkManager.swift
//  CodeChallenge
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import CodeChallengeCore
import PromiseKit

struct Network {
    
    func getForumInfo() -> Promise<Forum> {
        
        return Promise { fulfill, reject in
            
            Connection().requestForumInfo { result in
                
                switch result {
                    
                case let .Failure(error):
                    reject(error)
                    
                case let .Success(forum):
                    fulfill(forum)
                }
            }
        }
    }
}
