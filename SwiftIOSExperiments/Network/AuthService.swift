//
//  AuthService.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Auth0

struct Auth {
	var email: String
	var password: String

	init(email: String, password: String) {
		self.email = email
		self.password = password
	}
}

class AuthService {
	static var token: String!

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
