//
//  Protocols.swift
//  
//
//  Created by James Santos on 14/2/17.
//
//
import UIKit

protocol LoginValidation {}

protocol LoadingAuthentication {
	var spinner: UIActivityIndicatorView { get }

	func success(_ token: String)
	func failed(_ error: Any)
}
