//
//  ProfilePresenter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 16/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit
import Auth0

class ProfilePresenter: ProfilePresentation {
	weak var view: ProfileView?
	var interactor: ProfileUseCase!
	var router: ProfileRouter!

	var profile: Profile? = nil {
		didSet {
			if let profile = profile {
				view?.showProfileData(profile)
			}
		}
	}

	func viewDidLoad() {
		guard let token = AuthService.token else { return }

		interactor.fetchProfile(token)
	}
}

extension ProfilePresenter: ProfilesInteractorOutput {

	func profileFetched(_ profile: Profile) {
		self.profile = profile
	}

	func profileFetchedFailed(_ error: Error) {
		print("Error: \(error.localizedDescription)")
	}

	func logout() {
		router.proceedToLogin()
	}
}
