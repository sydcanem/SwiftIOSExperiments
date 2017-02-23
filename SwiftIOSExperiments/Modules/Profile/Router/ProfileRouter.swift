//
//  ProfileRouter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class ProfileRouter: ProfilesWireframe {
	weak var viewController: UIViewController?

	static func assembleModule() -> UIViewController {
		let storyboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
		// swiftlint:disable:next force_cast
		let view = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		let presenter = ProfilePresenter()
		let router = ProfileRouter()
		let interactor = ProfileInteractor()
		let navigation = UINavigationController(rootViewController: view)

		view.presenter = presenter

		presenter.view = view
		presenter.router = router
		presenter.interactor = interactor

		interactor.output = presenter

		router.viewController = view

		return navigation
	}

	func proceedToLogin() {
		self.viewController?.dismiss(animated: false, completion: nil)
	}
}
