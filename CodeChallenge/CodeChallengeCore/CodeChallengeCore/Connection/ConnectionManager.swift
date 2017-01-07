//
//  ConnectionManager.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import Alamofire

public enum Result<T> {
    
    case Failure(Error)
    case Success(T)
}

enum ConnectionError: Error {
    
    case responseNotJSON
    case unkwnon
}

public struct Connection {
    
    public init() {
        
    }
    
    func requestJSON(url: String, completion: @escaping (Result<AnyObject>) -> Void) {
        
        Alamofire.request(url).responseJSON { response in
            
            dump(response)
            
            guard let responseJSON = response.result.value else {
                
                return completion(.Failure(ConnectionError.responseNotJSON))
            }
            
            completion(.Success(responseJSON as AnyObject))
        }
    }
}
