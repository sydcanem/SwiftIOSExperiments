//
//  LoginInteractor.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 15/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class LoginInteractor: LoginUseCase {

	weak var output: LoginInteractorOutput!

	func authenticateUser(_ auth: Auth) {
		AuthService.authenticate(auth.email, auth.password, completion: { [weak self] result in
			DispatchQueue.main.async {
				switch result {
				case .success(let credentials):
					guard let idToken = credentials.accessToken else { return }

					AuthService.token = idToken
					self?.output.authenticationSuccess(idToken)
				case .failure(let error):
					self?.output.authenticationFailed(error)
				}
			}
		})
	}
}
