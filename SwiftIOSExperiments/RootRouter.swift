//
//  RootRouter.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

class RootRouter {

	func presentLoginScreen(in window: UIWindow) {
		window.makeKeyAndVisible()
		window.rootViewController = LoginRouter.assembleModule()
	}
}
