//
//  ApplicationInfo.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/15.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa

struct ApplicationData {
        
    let idetifier: String
    
    var icon: NSImage {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: idetifier) else {
            
            return NSImage(named: NSImage.applicationIconName)!
        }
        
        return NSWorkspace.shared.icon(forFile: url.path)
    }
    
    var localizedName: String {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: idetifier) else {
            
            return "Unknown Application"
        }
        
         return Bundle(url: url)?.localizedInfoDictionary?["CFBundleName"] as? String ?? "Unknown Application"
    }
}
