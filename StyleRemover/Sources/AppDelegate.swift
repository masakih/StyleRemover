//
//  AppDelegate.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    private let statusBar = StatusBar()
    private let clipboardFilter = ClipboardFilter()
    
    class var appName: String {
        
        guard let dict = Bundle.main.localizedInfoDictionary,
            let name = dict["CFBundleDisplayName"] as? String else {
                
                return "Style Remover"
        }
        return name
    }
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        
        UserDefaults.setUp()
    }
}
