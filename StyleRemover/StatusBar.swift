//
//  StatusBar.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa

struct StatusBar {
    
    private let myStatusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    private let menu = NSMenu()
    
    private let items: [StatusItem]
    
    init() {
        
        items = [
            PreferenceItem(),
            SeparatorItem(),
            QuitItem()
        ]
        
        items.reversed().forEach { $0.enter(menu) }
        
        myStatusBar.menu = menu
        myStatusBar.button?.image = NSImage(named: "MenuBarIconTemplate")
    }
}
