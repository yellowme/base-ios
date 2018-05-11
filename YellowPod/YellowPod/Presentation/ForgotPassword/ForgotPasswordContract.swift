//
//  ForgotPasswordContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 5/11/18.
//  Copyright © 2018 Yellowme. All rights reserved.
//

import Foundation

protocol ForgotPasswordView: BaseView {
    func showCallerScreen()
    func showMainScreen()
    func showSignUp()
}

protocol ForgotPasswordViewPresenter {
    init(view: ForgotPasswordView)
    func requestPasswordRecovery(for email: String)
    func goToSignUp()
}
