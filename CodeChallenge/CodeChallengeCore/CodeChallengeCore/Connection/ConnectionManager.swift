//
//  ConnectionManager.swift
//  CodeChallengeCore
//
//  Created by Jose Torres on 7/1/17.
//  Copyright © 2017 Jose Torres. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import SwiftyJSON

public enum Result<T> {
    
    case Failure(Error)
    case Success(T)
}

/// Protocol required for Models used in Connection
protocol ConnectionParseable {
    
    init?(json: JSON)
}

/// Enum of possible ConnectionError-s
///
/// - responseNotJSON: response could not be parsed as JSON error.
/// - unknown: unhandled error.
enum ConnectionError: Error {
    
    case requestWrongURL
    case responseNotJSON
    case responseConvertionToModelFailed
    case responseConvertionToImageFailed
    case unkwnon
}

/// Connection Manager main struct
public struct Connection {
    
    static let downloader = ImageDownloader()
    
    public init() {
        
    }
    
    /// Internal request method. Currently only supporting GET requests.
    ///
    /// - Parameters:
    ///   - url: String request url.
    ///   - completion: Completion closure.
    func requestJSONResource(url: String, completion: @escaping (Result<AnyObject>) -> Void) {
        
        Alamofire.request(url).responseJSON { response in
            
//            dump(response)
            
            guard let responseJSON = response.result.value else {
                
                return completion(.Failure(ConnectionError.responseNotJSON))
            }
            
            completion(.Success(responseJSON as AnyObject))
        }
    }
    
    /// Internal download image method.
    ///
    /// - Parameters:
    ///   - url: String image url.
    ///   - completion: Completion closure.
    func requestImageResource(url: String, completion: @escaping (Result<UIImage>) -> Void) {
        
        guard let url = URL(string: url) else {
            
            return completion(.Failure(ConnectionError.requestWrongURL))
        }
        
        let urlRequest = URLRequest(url: url)
        
        Connection.downloader.download(urlRequest) { response in
            
            guard let image = response.result.value else {
                
                return completion(.Failure(ConnectionError.responseConvertionToImageFailed))
            }
            
            completion(.Success(image))
        }
    }
    
    /// Internal generic response-type request method. Currently only supporting GET requests.
    ///
    /// - Parameters:
    ///   - url: String request url.
    ///   - completion: Completion closure with generic response-type.
    func requestJSON<T: ConnectionParseable>(url: String, completion: @escaping (Result<T>) -> Void) {
        
        requestJSONResource(url: url) { result in
            
            switch result {
                
            case let .Failure(error):
                
                return completion(.Failure(error))
                
            case let .Success(object):
                
                let json = JSON(object)
                guard let object = T(json: json) else {
                    
                    return completion(.Failure(ConnectionError.responseConvertionToModelFailed))
                }
                
                completion(.Success(object))
                break
            }
        }
    }
}
