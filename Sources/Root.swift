//
//  Root.swift
//  Monolingual
//
//  Created by Ingmar Stein on 16.07.14.
//
//

import Foundation

struct Root {
	let path : String
	let languages : Bool
	let architectures : Bool

	static var defaults: [[String: NSObject]] {
		let applications = [ "Path" : "/Applications", "Languages" : true, "Architectures" : true ]
		let localLibrary = [ "Path" : "/Library", "Languages" : true, "Architectures" : true ]
		return [ applications, localLibrary ]
	}
	
	init(dictionary: [NSObject:AnyObject]) {
		self.path = dictionary["Path"] as? String ?? ""
		self.languages = dictionary["Languages"]?.boolValue ?? false
		self.architectures = dictionary["Architectures"]?.boolValue ?? false
	}

}
