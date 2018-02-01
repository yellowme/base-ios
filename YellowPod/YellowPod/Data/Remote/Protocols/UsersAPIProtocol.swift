//
//  UsersAPIProtocol.swift
//  YellowPod
//
//  Created by Maria Jose Patron on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol UsersAPIProtocol: RemoteDataSource {    
    func getCurrent(completion: @escaping (User?, String?) -> Void)
}
