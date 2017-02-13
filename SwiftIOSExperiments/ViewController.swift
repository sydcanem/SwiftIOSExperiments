//
//  ViewController.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginValidation, LoadingAuthentication {
	let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)

	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!

	var emailValidationMessage: String?
	var passwordValidationMessage: String?

    override func viewDidLoad() {
        super.viewDidLoad()

		spinner.hidesWhenStopped = true
		spinner.center = view.center

		view.addSubview(spinner)
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
				let resource = Auth(email: email, password: password)

				authenticate(auth: resource)
			}
		}
	}

	func success(_ token: String) {
		print("Token: \(token)")
	}

	func failed(_ error: Any) {
		print("Error: \(error)")
	}
}
