//
//  LoginPresenter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresentation, LoadingAuthentication {
	let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)

	weak var view: UIViewController?
	var router: LoginRouter!
	var interactor: LoginUseCase!

	func viewDidLoad() {
		spinner.hidesWhenStopped = true
		spinner.center = (view?.view.center)!

		view?.view.addSubview(spinner)
	}

	func showProfile() {
		router.presentProfile()
	}

	func authenticateUser(_ auth: Auth) {
		interactor.authenticateUser(auth)
		spinner.startAnimating()
	}
}

extension LoginPresenter: LoginInteractorOutput {

	func authenticationSuccess(_ token: String) {
		spinner.stopAnimating()
		router.presentProfile()
	}

	func authenticationFailed(_ error: Any) {
		print("Error: \(error)")
	}
}
