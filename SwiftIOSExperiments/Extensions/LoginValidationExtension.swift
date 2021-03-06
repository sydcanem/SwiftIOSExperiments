//
//  Extensions.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Foundation
import UIKit

extension LoginValidation {
	func isValidEmail(_ email: String) -> Bool {
		// swiftlint:disable:next line_length
		let emailRegex = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
		let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)

		return emailTest.evaluate(with: email)
	}

	// Password validation just trims the password for now
	func isValidPassword(_ password: String?) -> Bool {
		return password?.trimmingCharacters(in: .whitespacesAndNewlines) != nil
	}
}

extension LoginView where Self: UIViewController {
	func startAnimating() {
		self.spinner.startAnimating()
	}

	func stopAnimating() {
		self.spinner.stopAnimating()
	}
}
