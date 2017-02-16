//
//  LoginPresenter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresentation {
	weak var view: LoginView?
	var router: LoginRouter!
	var interactor: LoginUseCase!

	func viewDidLoad() {}

	func showProfile() {
		router.presentProfile()
	}

	func authenticateUser(_ auth: Auth) {
		interactor.authenticateUser(auth)
		view?.startAnimating()
	}
}

extension LoginPresenter: LoginInteractorOutput {

	func authenticationSuccess(_ token: String) {
		router.presentProfile()
		view?.stopAnimating()
	}

	func authenticationFailed(_ error: Error) {
		print("Error: \(error.localizedDescription)")
		view?.stopAnimating()
	}
}
