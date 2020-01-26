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
        
    let identifier: String
    
    init(identifier: String) {
        
        self.identifier = identifier
    }
    
    private(set) lazy var icon: NSImage = {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: identifier) else {
            
            return NSImage(named: NSImage.applicationIconName)!
        }
        
        guard let resource = try? url.resourceValues(forKeys: [.effectiveIconKey, .customIconKey]) else {
            
            return NSImage(named: NSImage.applicationIconName)!
        }
        
        return resource.customIcon ??
            resource.effectiveIcon as? NSImage ??
            NSImage(named: NSImage.applicationIconName)!
    }()
    
    private(set) lazy var localizedName: String = {
        
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: identifier) else {
            
            return unknownAppName
        }
        
        let appBundle = Bundle(url: url)
        
        return localizedFileName ??
            appBundle?.localizedInfoDictionary?["CFBundleDisplayName"] as? String ??
            appBundle?.localizedInfoDictionary?["CFBundleName"] as? String ??
            unknownAppName
    }()
    
    private lazy var localizedFileName: String? = {
                
        guard let url = NSWorkspace.shared.urlForApplication(withBundleIdentifier: identifier) else {
            
            return unknownAppName
        }
        
        guard let resource = try? url.resourceValues(forKeys: [.localizedNameKey]) else { return nil }
        
        return resource.localizedName
    }()
}
