//
//  AuthService.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Foundation
import Auth0

class AuthService {
	static func authenticate(_ email: String, _ password: String,
	                         completion: @escaping (_ result: Result<Credentials>) -> Void) {
		Auth0
			.authentication()
			.login(
				usernameOrEmail: email,
				password: password,
				connection: "Username-Password-Authentication"
			)
			.start(completion)
	}
}
