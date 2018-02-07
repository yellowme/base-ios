//
//  String+Ext.swift
//

import Foundation

extension String {
    // MARK: - Consntats
    // HERE: Add yours
    static let empty = ""
    static let appName = "Yellowpod" // TODO: Change for your app
    static let emptyList = "No hay resultados"
    static let understood = "Entendido"
    static let cancel = "Cancelar"
    static let forgetIt = "Olvídalo"
    static let fillAllFields = "Por favor, llena todos los campos"
    static let unknownZone = "Ubicación desconocida"
    static let no = "No"
    static let yes = "Si"
    
    // MARK: - Validations
    // HERE: Add yours
    static let enterValidName = "Ingresa un nombre válido"
    
    // MARK: - Icons
    // HERE: Add yours
    static let closeIcon = "close"
    
    //MARK: - Messages
    // HERE: Add yours
    static let invalidCodeMsg = "El código introducido es inválido"
    static let serverError = "Lo sentimos, no se pudo solicitar su servicio."
}

//MARK: - Conversion Helper
extension String {
    var toDouble: Double {
        return Double(self) ?? 0.0
    }
    
    func isNotEmpty() -> Bool {
        return self != ""
    }
}

extension String {
    func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return evaluateRegex(emailRegex)
    }
    
    func isPhoneNumber() -> Bool {
        //let phoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        //let phoneRegex = "^((\\+)|(00))[0-9]{10}$"
        let phoneRegex = "^\\+52[0-9]{10}$"
        return evaluateRegex(phoneRegex)
    }
    
    //MARK: - Regex Helper
    fileprivate func evaluateRegex(_ regex: String) -> Bool {
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicateTest.evaluate(with: self)
    }
}
