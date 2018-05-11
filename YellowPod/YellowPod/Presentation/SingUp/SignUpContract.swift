//
//  SignUpContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 5/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

struct Credentials {
    //HERE: Add or change variables
    let email: String
    let password: String
}

protocol SignUpView: BaseView {
    func displayTermsNConditionsNotReadIfNeeded()
    func showLoginScreen(with email: String?)
    func showMainScreen()
}

protocol SignUpViewPresenter {
    init(view: SignUpView)
    func updateConfirmTermsNConditions(to hasRead: Bool)
    func signUp(with credentials: Credentials)
}
