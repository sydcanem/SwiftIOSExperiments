//
//  LoginRouter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class LoginRouter {
	weak var viewController: UIViewController?

	static func assembleModule() -> UIViewController {
		let storyboard = UIStoryboard(name: "LoginStoryboard", bundle: nil)
		// swiftlint:disable:next force_cast
		let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
		let presenter = LoginPresenter()
		let router = LoginRouter()
		let interactor = LoginInteractor()

		view.presenter = presenter

		presenter.view = view
		presenter.router = router
		presenter.interactor = interactor

		interactor.output = presenter

		router.viewController = view

		return view
	}

	func presentProfile() {
		let profileModuleController = ProfileRouter.assembleModule()
		viewController?.present(profileModuleController, animated: false)
	}
}
