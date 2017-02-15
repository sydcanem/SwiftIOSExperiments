//
//  ViewController.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginValidation {
	var presenter: LoginPresenter!

	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!

	var emailValidationMessage: String?
	var passwordValidationMessage: String?

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.viewDidLoad()
	}

	@IBAction func login(_ button: UIButton) {
		if let email: String = email.text, let password: String = password.text {
			if !isValidEmail(email) {
				emailValidationMessage = "Invalid email address"
			}

			if !isValidPassword(password) {
				passwordValidationMessage = "Invalid password"
			}

			if (emailValidationMessage != nil) || (passwordValidationMessage != nil) {
				print(emailValidationMessage ?? "")
				print(passwordValidationMessage ?? "")

				emailValidationMessage = nil
				passwordValidationMessage = nil
			} else {
				presenter.authenticateUser(Auth(email: email, password: password))
			}
		}
	}
}
