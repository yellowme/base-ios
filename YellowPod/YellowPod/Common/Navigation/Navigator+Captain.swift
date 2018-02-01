//
//  NavigationHelper.swift
//  YellowPod
//
//  Created by Erick A. Montañez  on 11/29/17.
//  Copyright © 2017 YellowPod. All rights reserved.
//

import Foundation

//MARK: Nodes
public enum Segue: String {
    //Here add your segues
    case fromLoginToMain = "fromLoginToMain"
    case fromLoginToAccessCode = "fromLoginToAccessCode"
    case fromReviewToComment = "fromReviewToComment"
    case fromMainToPreview = "fromMainToPreview"
    case stepsContainer = "stepsContainer"
    case toDateStep = "toDateStep"
    case toInfoStep = "toInfoStep"
}

public enum Storyboard: String {
    //Here add your storyboard identifiers
    case main = "Map"
    case login = "Login"
    case accessCode = "AccessCode"
    case preview = "Preview"
    case review = "Review"
    case show = "ShowService"
    case serviceDate = "ServiceDate"
    case serviceInfo = "ServiceInfo"
    case serviceSuccess = "ServiceSuccess"
    case dispatch = "Dispatch"
}

public enum Controller: String {
    //Here add your view controllers by name
    case main = "MapViewController"
    case login = "LoginViewController"
    case accessCode = "AccessCodeViewController"
    case preview = "PreviewViewController"
    case show = "ShowServiceViewController"
    case review = "ReviewServiceViewController"
    case serviceDate = "ServiceDateViewController"
    case serviceInfo = "ServiceInfoViewController"
    case serviceSuccess = "ServiceSuccessDialogViewController"
    case dispatch = "DispatchViewController"
}

