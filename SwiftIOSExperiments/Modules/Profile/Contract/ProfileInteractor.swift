//
//  ProfileInteractor.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 15/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class ProfileInteractor: ProfileUseCase {

	weak var output: ProfilesInteractorOutput!

	func fetchProfile(_ idToken: String) {
		ProfileService.getUserInfo(idToken, completion: { [weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let profile):
					self?.output.profileFetched(profile)
				case .failure(let error):
					self?.output.profileFetchedFailed(error)
				}
			}
		})
	}
}
