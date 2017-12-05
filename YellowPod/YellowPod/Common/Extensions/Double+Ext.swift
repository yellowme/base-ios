//
//  Double+Ext.swift
//

import Foundation
import UIKit

extension Double {
    func moneyStringWith(numberOfDigits: Int) -> String {
        return "$\(self.stringWith(numberOfDigits: numberOfDigits))"
    }
    
    func twoDigitsString() -> String {        
        return self.stringWith(numberOfDigits: 2)
    }
    
    func stringWith(numberOfDigits: Int) -> String {
        return String(format:"%.\(numberOfDigits)f", self)
    }
}

extension CGFloat {
    func asPercentage(_ percetage: Int) -> CGFloat {
        return self * CGFloat(percetage)
    }
}
