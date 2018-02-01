//
//  UITextField+Rules.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/19/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

extension UITextField {
    func hasOnlyDigits(withMax: Int, comparedTo: String, onRange: NSRange) -> Bool {        
        guard let text = text else { return true }
        
        let allowedCharacters = CharacterSet.decimalDigits
        let textIsNumber = allowedCharacters.isSuperset(of: CharacterSet(charactersIn: comparedTo))
        let newLength = text.count + comparedTo.count - onRange.length
        
        return newLength <= withMax && textIsNumber
    }
}
