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

/// Enum of possible ConnectionError-s
///
/// - responseNotJSON: response could not be parsed as JSON error.
/// - unknown: unhandled error.
enum ConnectionError: Error {
    
    case responseNotJSON
    case unkwnon
}

/// Connection Manager main struct
public struct Connection {
    
    public init() {
        
    }
    
    /// Internal request method. Currently only supporting GET requests.
    ///
    /// - Parameters:
    ///   - url: String request url.
    ///   - completion: Completion closure.
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
