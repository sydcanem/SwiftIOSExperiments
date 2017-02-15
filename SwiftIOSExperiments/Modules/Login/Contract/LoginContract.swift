//
//  LoginContract.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

protocol LoginValidation {}

protocol LoadingAuthentication {
	var spinner: UIActivityIndicatorView { get }
}

protocol LoginPresentation: class {
	weak var view: UIViewController? { get set }
	var interactor: LoginUseCase! { get set }
	var router: LoginRouter! { get set }

	func viewDidLoad()
	func authenticateUser(_ auth: Auth)
}

protocol LoginInteractorOutput: class {
	func authenticationSuccess(_ token: String)
	func authenticationFailed(_ error: Any)
}

protocol LoginUseCase: class {
	weak var output: LoginInteractorOutput! { get set }

	func authenticateUser(_ auth: Auth)
}
