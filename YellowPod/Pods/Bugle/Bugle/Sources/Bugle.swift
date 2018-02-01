//
//  Bugle.swift
//  Yellowme
//
//  Created by Luis Burgos on 1/3/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import UIKit

public struct BugleOptions {
    public let tintColor: UIColor?
    public let errorTintColor: UIColor?
    public let cancelMessage: String
    public let commonTitle: String
    public let commonAction: String
    
    public init(tintColor: UIColor?, cancelMessage: String, commonTitle: String, commonAction: String, errorTintColor: UIColor?) {
        self.tintColor = tintColor
        self.cancelMessage = cancelMessage
        self.commonTitle = commonTitle
        self.commonAction = commonAction
        self.errorTintColor = errorTintColor
    }
}

typealias BugleActionStyles = (confirm: UIAlertActionStyle, cancel: UIAlertActionStyle, color: UIColor?)

@objc public protocol BugleDelegate {
    func didConfirm()
    @objc optional func didCancel()
}

public class Bugle {
    public static let shared = Bugle()
    private static var preferredOptions: BugleOptions?
    
    public class func setup(with options: BugleOptions) {
        Bugle.preferredOptions = options
    }
    
    private init() { }
    
    public func play(
        _ message: String,
        _ title: String? = nil,
        _ actionTitle: String? = nil,
        _ decorated: Bool = true,
        _ delegate: BugleDelegate? = nil,
        on controller: UIViewController,
        type: BugleType = .single){
        
        guard
            let preferredOptions = Bugle.preferredOptions,
            let style = type.style() else {
                fatalError("Error - you must call setup before accessing this method")
        }
        
        let alert = prepare(with: title ?? preferredOptions.commonTitle, message)
        let actionTitle = actionTitle ?? preferredOptions.commonAction
        
        switch type {
        case .risky:
            fallthrough
        case .confirmation:
            alert.addAction(UIAlertAction(title: actionTitle, style: style.confirm, handler: { (action: UIAlertAction!) in
                delegate?.didConfirm()
            }))
            alert.addAction(UIAlertAction(title: preferredOptions.cancelMessage, style: style.cancel, handler: { (action: UIAlertAction!) in
                delegate?.didCancel?()
            }))
            break
        default:
            alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default) { action in
                delegate?.didConfirm()
            })
        }
        
        if decorated {
            presentDecorated(alert, on: controller, tintColor: style.color)
        } else {
            controller.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: Styling
    
    public enum BugleType {
        case single
        case confirmation
        case risky
        
        func style() -> BugleActionStyles? {
            guard let preferredOptions = Bugle.preferredOptions else { return nil }
            
            switch self {
            case .risky:
                return (.cancel, .default, preferredOptions.errorTintColor)
            default:
                return (.default, .cancel, preferredOptions.tintColor)
            }
        }
    }
}

extension Bugle {
    internal func prepare(with title: String, _ message: String) -> UIAlertController{
        return UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    }
    
    internal func presentDecorated(_ alert: UIAlertController, on: UIViewController, tintColor: UIColor?) {
        if let tintColor = tintColor {
            alert.view.tintColor = tintColor
            on.present(alert, animated: true, completion: {
                alert.view.tintColor = tintColor
            })
        }
    }
}


