//
//  ApplicationInfo.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/15.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa


private let unknownAppName = "Unknown Application"

struct ApplicationData {
        
    let idetifier: String
    
    var icon: NSImage {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: idetifier) else {
            
            return NSImage(named: NSImage.applicationIconName)!
        }
        
        guard let resource = try? url.resourceValues(forKeys: [.effectiveIconKey, .customIconKey]) else {
            
            return NSImage(named: NSImage.applicationIconName)!
        }
        
        return resource.customIcon ??
            resource.effectiveIcon as? NSImage ??
            NSImage(named: NSImage.applicationIconName)!
    }
    
    var localizedName: String {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: idetifier) else {
            
            return unknownAppName
        }
        
        let appBundle = Bundle(url: url)
        
        return localizedFileName ??
            appBundle?.localizedInfoDictionary?["CFBundleDisplayName"] as? String ??
            appBundle?.localizedInfoDictionary?["CFBundleName"] as? String ??
            unknownAppName
    }
    
    private var localizedFileName: String? {
                
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: idetifier) else {
            
            return unknownAppName
        }
        
        guard let resource = try? url.resourceValues(forKeys: [.localizedNameKey]) else { return nil }
        
        return resource.localizedName
    }
}
