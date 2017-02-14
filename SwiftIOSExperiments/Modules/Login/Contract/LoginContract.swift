//
//  LoginContract.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

protocol LoginPresentation: class {
	var router: LoginRouter! { get set }

	func viewDidLoad()
}
