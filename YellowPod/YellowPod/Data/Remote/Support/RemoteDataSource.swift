//
//  RemoteDataSource.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol RemoteDataSource {
    func serverRequest(
        _ urlRequest: URLRequestConvertible,
        _ parser: Parser?,
        _ errorHandler: HorrorHandler?,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void
    )
}

//MARK: - Generic Request
extension RemoteDataSource {
    func serverRequest(
        _ urlRequest: URLRequestConvertible,
        _ parser: Parser? = nil,
        _ errorHandler: HorrorHandler? = nil,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void ) {
        
        debugPrint("REQUEST")
        Alamofire
            .request(urlRequest)
            .responseJSON { response in
                debugPrint("RESPONSE")
                debugPrint(response)
                switch response.result {
                case .success:
                    if let value = response.result.value, (200..<300).contains(response.response!.statusCode) {                                        
                        self.handleTrueSuccess(JSON(value), parser, completion)
                    } else {
                        self.handleErrorOnSupposedSuccess(response, errorHandler, completion)
                    }
                case .failure(let error):
                    debugPrint("Error on failure")
                    print(error)
                    completion(nil, error.localizedDescription)
                }
        }
    }
    
    private func handleErrorOnSupposedSuccess(
        _ response: DataResponse<Any>,
        _ errorHandler: HorrorHandler? = nil,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void) {
        
        //TODO: Handle error response
        debugPrint("Error on success")
        let error =
            errorHandler?.horrorHandler(code: response.response!.statusCode) ??
                (response.result.error?.localizedDescription ?? "Error")
        completion(nil, error)
    }
    
    private func handleTrueSuccess(
        _ json: JSON,
        _ parser: Parser? = nil,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void) {
        
        if let parser = parser {
            do {
                let data = try parser.parse(json)
                completion(data, nil)
            } catch let error as SerializationError {
                debugPrint(error)
                completion(nil, error.localizedDescription)
            } catch {
                completion(nil, "Error")//TODO: Extract
            }
        } else{
            completion(nil, nil)
        }
    }
}
