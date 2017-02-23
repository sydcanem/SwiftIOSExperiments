//
//  ProfileViewController.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit
import Auth0

class ProfileViewController: UIViewController {
	var presenter: ProfilePresentation!

	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var email: UILabel!
	@IBOutlet weak var nickName: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		presenter.viewDidLoad()
	}

	fileprivate func setupView() {
		name.text = ""
		email.text = ""
		nickName.text = ""

		self.navigationItem.title = "Profile"
		self.navigationItem.leftBarButtonItem =
			UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout))
	}

	@objc func logout() {
		presenter.logout()
	}
}

extension ProfileViewController: ProfileView {

	func showProfileData(_ profile: Profile) {
		name.text = profile.name
		email.text = profile.email
		nickName.text = profile.nickname
	}
}
