//
//  StatusBar.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

class StatusBar {
    
    private let myStatusBar = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    private let menu = NSMenu()
    
    private let items: [StatusItem]
    
    private var cancellalbes: [AnyCancellable] = []
    
    init() {
        
        items = [
            RemoverStatusItem(),
            OnOffItem(),
            SeparatorItem(),
            PreferenceItem(),
            SeparatorItem(),
            QuitItem()
        ]
        
        items.reversed().forEach { $0.enter(menu) }
        
        myStatusBar.menu = menu
        myStatusBar.button?.image = icon
        
        UserDefaults.standard
            .publisher(for: \.isEnabled)
            .receive(on: DispatchQueue.main)
            .sink { enabled in
                
                self.myStatusBar.button?.image = self.icon
        }
        .store(in: &cancellalbes)
    }
    
    private var icon: NSImage? {
        
        UserDefaults.standard.isEnabled ? NSImage(named: "MenuBarIconTemplate") : NSImage(named: "MenuBarIconDisabled")
    }
}
