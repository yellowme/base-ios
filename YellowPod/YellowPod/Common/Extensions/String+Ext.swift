//
//  String+Ext.swift
//

import Foundation

extension String {
    var toDouble: Double {
        return Double(self) ?? 0.0
    }
}

extension String {
    func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return evaluateRegex(emailRegex)
    }
    
    func isPhoneNumber() -> Bool {
        //let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneRegex = "^[0-9]{10}$"
        return evaluateRegex(phoneRegex)
    }
    
    fileprivate func evaluateRegex(_ regex: String) -> Bool {
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicateTest.evaluate(with: self)
    }
}
