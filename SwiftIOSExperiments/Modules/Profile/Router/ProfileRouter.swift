//
//  ProfileRouter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Foundation
import UIKit

class ProfileRouter: ProfileWireframe {
	weak var viewController: UIViewController?

	static func assembleModule() -> UIViewController {
		let storyboard = UIStoryboard(name: "ProfileStoryboard", bundle: nil)
		// swiftlint:disable:next force_cast
		let view = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
		let router = ProfileRouter()
		let navigation = UINavigationController(rootViewController: view)

		router.viewController = view

		return navigation
	}
}
