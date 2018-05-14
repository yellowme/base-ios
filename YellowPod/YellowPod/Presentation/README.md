# Presentation

This repo contains default implementation for common feautures like:
- Dispatching the user on launch
- Login
- Sign Up
- Forgot Password

**Note:** This definition is using the MVP pattern approach.

### BaseView

```swift
//
//  BaseView.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/15/17.
//  Copyright © 2017 Yellowme. All rights reserved.
//

import UIKit

protocol BaseView: class {
    func setProgress(to isLoading: Bool, with alpha: CGFloat?, overlay: UIColor?)
    func display(_ message: String?)
}

```

**Note:** This definition is using the MVP pattern approach.

## Dispatch

```swift
protocol DispatcherDelegate {
    func decorateViewIfNeeded()
    func shouldDisplayNoConnection()
    func shouldUpdateView()
    func willLoadPreferences()
    func willLoadData()
}
```

**Note:** You must extend the class [`BaseDispatchViewController`](./Dispatch/BaseDispatchViewController.swift) in order to add your own implementation.

## Login

```swift
//
//  LoginContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 12/13/17.
//  Copyright © 2017 Yellowme. All rights reserved.
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
```

## Sign Up

```swift
//
//  SingUpContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 4/22/17.
//  Copyright © 2017 Yellowme. All rights reserved.
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
```

## Forgot Password

```swift
//
//  ForgotPasswordContract.swift
//  YellowPod
//
//  Created by Luis Burgos on 4/22/17.
//  Copyright © 2017 Yellowme. All rights reserved.
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
```

