//
//  ViewController.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginValidation {
	
	@IBOutlet var email: UITextField!
	@IBOutlet var password: UITextField!
	
	var emailValidationMessage: String? = nil
	var passwordValidationMessage: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
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
				AuthService.authenticate(email, password) { result in
					switch result {
					case .success(let credentials):
						guard let idToken = credentials.idToken else { return }
						
						print("Successfully logged-in: \(idToken)")
					case .failure(let error):
						print("Error: \(error)")
					}
				}
			}
		}
	}
}
