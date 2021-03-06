//
//  AppDelegate.swift
//  Monolingual
//
//  Created by Ingmar Stein on 14.07.14.
//
//

import Cocoa
import Fabric
import Crashlytics

let ProcessApplicationNotification = "ProcessApplicationNotification"

@NSApplicationMain
final class AppDelegate: NSObject, NSApplicationDelegate {
	var preferencesWindowController : NSWindowController?

	func applicationDidFinishLaunching(_: NSNotification) {
		let defaultDict  = [ "Roots" : Root.defaults, "Trash" : false, "Strip" : false, "NSApplicationCrashOnExceptions" : true ]

		NSUserDefaults.standardUserDefaults().registerDefaults(defaultDict as! [String : AnyObject])

		Fabric.with([Crashlytics()])
	}

	func applicationShouldTerminateAfterLastWindowClosed(_: NSApplication) -> Bool {
		return true
	}

	func application(sender: NSApplication, openFile filename: String) -> Bool {
		let dict = [ "Path" : filename, "Language" : true, "Architectures" : true ]
		
		NSNotificationCenter.defaultCenter().postNotificationName(ProcessApplicationNotification, object: self, userInfo: (dict as [NSObject : AnyObject]))
		
		return true
	}
	
	//MARK: - Actions
	
	@IBAction func documentationBundler(sender : NSMenuItem) {
		let docURL = NSBundle.mainBundle().URLForResource(sender.title, withExtension:nil)
		NSWorkspace.sharedWorkspace().openURL(docURL!)
	}
	
	@IBAction func openWebsite(_: AnyObject) {
		NSWorkspace.sharedWorkspace().openURL(NSURL(string:"https://ingmarstein.github.io/Monolingual")!)
	}
	
	@IBAction func donate(_: AnyObject) {
		NSWorkspace.sharedWorkspace().openURL(NSURL(string:"https://ingmarstein.github.io/Monolingual/donate.html")!)
	}

	@IBAction func showPreferences(sender: AnyObject) {
		if preferencesWindowController == nil {
			let storyboard = NSStoryboard(name:"Main", bundle:nil)
			preferencesWindowController = storyboard.instantiateControllerWithIdentifier("PreferencesWindow") as? NSWindowController
		}
		preferencesWindowController?.showWindow(sender)
	}
}
