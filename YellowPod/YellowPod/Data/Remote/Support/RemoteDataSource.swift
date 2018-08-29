//
//  RemoteDataSource.swift
//  YellowPod
//
//  Created by Luis Burgos on 11/24/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation
import Alamofire

public class ServerRequest<Model: Decodable> {
    public typealias CompletionHandler = (Model?, Error?) -> Void
    
    // no further changes
    public var completionHandler: CompletionHandler
    public var endPoint: URLRequestConvertible
    
    public init(endPoint: URLRequestConvertible, completionHandler: @escaping CompletionHandler) {
        self.endPoint = endPoint
        self.completionHandler = completionHandler
    }
}

protocol RemoteDataSource {
    func serverRequest<Model: Decodable>(
        _ request: ServerRequest<Model>,
        _ errorHandler: HorrorHandler?
    )
}

//MARK: - Generic Request
extension RemoteDataSource {
    func serverRequest<Model: Decodable>(
        _ request: ServerRequest<Model>,
        _ errorHandler: HorrorHandler? = nil) {
        debugPrint("REQUEST")
        Alamofire
            .request(request.endPoint)
            .responseJSON { response in
                debugPrint("RESPONSE")
                debugPrint(response)
                switch response.result {
                case .success:
                    if (200..<300).contains(response.response!.statusCode) {
                        self.handleTrueSuccess(response, request)
                    } else {
                        self.handleErrorOnSupposedSuccess(response, errorHandler, request)
                    }
                case .failure(let error):
                    debugPrint("Error on failure")
                    print(error)
                    request.completionHandler(nil, error)
                }
        }
    }
    
    private func handleErrorOnSupposedSuccess<Model: Decodable>(
        _ response: DataResponse<Any>,
        _ errorHandler: HorrorHandler? = nil,
        _ request: ServerRequest<Model>) {
        
        //TODO: Handle error response
        debugPrint("Error on success")
        let error =
            errorHandler?.horrorHandler(code: response.response!.statusCode) ??
                (response.result.error?.localizedDescription ?? "Error")
        
        request.completionHandler(nil, error)
    }
    
    private func handleTrueSuccess<Model: Decodable>(
        _ response: DataResponse<Any>,
        _ request: ServerRequest<Model>) {
        
        let decoder = JSONDecoder()
        let data: Result<Model> = decoder.decodeResponse(from: response)
        switch data {
        case .failure(let error):
            request.completionHandler(nil, error)
        default:
            request.completionHandler(data.value, nil)
        }
        
    }
}

//MARK: - Decoder

/// Simply allow to throw strings as Error
extension String: Error {}

extension JSONDecoder {
    /// Reference: https://grokswift.com/decodable-with-alamofire-4/
    func decodeResponse<T: Decodable>(from response: DataResponse<Any>) -> Result<T> {
        guard response.error == nil else {
            print(response.error!)
            return .failure(response.error!)
        }
        
        guard let responseData = response.data else {
            print("didn't get any data from API")
            return .failure("Did not get data in response")
        }
        
        do {
            let item = try decode(T.self, from: responseData)
            return .success(item)
        } catch {
            return .failure(error)
        }
    }
}
