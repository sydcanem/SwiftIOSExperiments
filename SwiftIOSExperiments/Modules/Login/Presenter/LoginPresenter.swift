//
//  LoginPresenter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Foundation

class LoginPresenter: LoginPresentation {

	var router: LoginRouter!

	func viewDidLoad() {
	}

	func showProfile() {
		router.presentProfile()
	}
}
