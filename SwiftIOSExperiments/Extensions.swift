//
//  Extensions.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import Foundation
import UIKit

protocol LoginValidation {}

protocol LoadingAuthentication {
	var spinner: UIActivityIndicatorView { get }

	func success(_ token: String)
	func failed(_ error: Any)
}

extension LoginValidation {
    func isValidEmail(_ email: String) -> Bool {
		// swiftlint:disable:next line_length
        let emailRegex = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"+"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"+"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"+"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"+"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"+"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"+"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailTest = NSPredicate(format: "SELF MATCHES[c] %@", emailRegex)

		return emailTest.evaluate(with: email)
    }

	// Password validation just trims the password for now
    func isValidPassword(_ password: String?) -> Bool {
        guard (password?.trimmingCharacters(in: .whitespacesAndNewlines)) != nil else {
            return false
        }

        return true
    }
}

extension LoadingAuthentication where Self: UIViewController {
	func authenticate(auth: Auth) {
		spinner.startAnimating()

		AuthService.authenticate(auth.email, auth.password,
		                         completion: { [weak self] result in
			switch result {
			case .success(let credentials):
				guard let idToken = credentials.idToken else { return }

				self?.success(idToken)
			case .failure(let error):
				self?.failed(error)
			}

			self?.spinner.stopAnimating()
		})
	}
}
