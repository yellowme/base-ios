//
//  LoginContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 5/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol LoginView: BaseView {
    func showSignUpScreen()
    func showForgotPasswordScreen()
    func showMainScreen()
}

protocol LoginViewPresenter {
    associatedtype APIServiceProtocol
    init(view: LoginView, apiService: APIServiceProtocol)
    func login(_ name: String?, passsword: String?)
}
