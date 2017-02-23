//
//  AppDelegate.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 10/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	// swiftlint:disable:next line_length
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
		window = UIWindow(frame: UIScreen.main.bounds)
		RootRouter().presentLoginScreen(in: window!)
		return true
	}
}
