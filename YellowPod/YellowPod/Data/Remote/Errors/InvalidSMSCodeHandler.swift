//
//  ErrorHandlers.swift
//  YellowPod
//
//  Created by Luis Burgos on 1/19/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

class InvalidSMSCodeHandler: HorrorHandler {
    func horrorHandler(code: Int) -> String? {
        if code == 422 {
            return String.invalidCodeMsg
        }
        return nil
    }
}
