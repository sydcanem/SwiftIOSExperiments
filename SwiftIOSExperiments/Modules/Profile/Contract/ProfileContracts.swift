//
//  ProfileContracts.swift
//  SwiftIOSExperiments
//
//  Created by James Santos on 14/2/17.
//  Copyright © 2017 James Santos. All rights reserved.
//

import UIKit

protocol ProfileWireframe: class {
	weak var viewController: UIViewController? { get set }

	static func assembleModule() -> UIViewController
}
