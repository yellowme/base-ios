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
        _ errorHandler: ((Int) -> String?)?,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void
    )
}

protocol AuthenticatedDataSource: RemoteDataSource {
    //TODO: Evaluate best method to handle this behavior
}

//MARK: - Generic Request
extension RemoteDataSource {
    func serverRequest(
        _ urlRequest: URLRequestConvertible,
        _ parser: Parser? = nil,
        //TODO: Create generic way to handle errors
        _ errorHandler: ((Int) -> String?)? = nil,
        _ completion: @escaping (_ data: [APIModel]?, _ error : String?) -> Void
        ) {
        debugPrint("REQUEST")
        Alamofire
            .request(urlRequest)
            .responseJSON { response in
                debugPrint("RESPONSE")
                debugPrint(response)
                switch response.result {
                case .success:
                    if let value = response.result.value, (200..<300).contains(response.response!.statusCode) {
                        let json = JSON(value)
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
                    } else {
                        //TODO: Handle error response
                        debugPrint("Error on success")
                        let error =
                            errorHandler?(response.response!.statusCode) ??
                                (response.result.error?.localizedDescription ?? "Error")
                        completion(nil, error)
                    }
                case .failure(let error):
                    debugPrint("Error on failure")
                    print(error)
                    completion(nil, error.localizedDescription)
                }
        }
    }
}

