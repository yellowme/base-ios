//
//  StringHelper.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/27/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import Foundation

class StringHelper {
    static func buildCombinatedContent(_ parts: NSMutableAttributedString...) -> NSMutableAttributedString {
        let combination = NSMutableAttributedString()
        parts.forEach { part in combination.append(part) }
        return combination
    }
}
