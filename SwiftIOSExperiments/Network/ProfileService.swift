//
//  ProfileService.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 15/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Auth0

class ProfileService {

	static func getUserInfo(_ idToken: String,
	                        completion: @escaping (_ result: Result<Profile>) -> Void) {

		Auth0
			.authentication()
			.userInfo(token: idToken)
			.start(completion)
	}
}
