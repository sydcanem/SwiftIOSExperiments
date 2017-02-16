//
//  ProfileContract.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit
import Auth0

protocol ProfileView: class {
	var presenter: ProfilePresentation! { get set }

	func showProfileData(_ profile: Profile)
}

protocol ProfilesWireframe: class {
	weak var viewController: UIViewController? { get set }

	static func assembleModule() -> UIViewController
	func proceedToLogin()
}

protocol ProfilePresentation: class {
	weak var view: ProfileView? { get set }
	var interactor: ProfileUseCase! { get set }
	var router: ProfileRouter! { get set }

	func viewDidLoad()
	func logout()
}

protocol ProfileUseCase: class {
	weak var output: ProfilesInteractorOutput! { get set }

	func fetchProfile(_ idToken: String)
}

protocol ProfilesInteractorOutput: class {
	func profileFetched(_ profile: Profile)
	func profileFetchedFailed(_ error: Error)
}
