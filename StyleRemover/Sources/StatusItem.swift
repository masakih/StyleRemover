//
//  StatusItem.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa

protocol StatusItem {
    
    var menuItem: NSMenuItem { get }
    
    func enter(_ menu: NSMenu)
    func remove()
}

extension StatusItem {
    
    func enter(_ menu: NSMenu) {
        
        if let currentMenu = menuItem.menu,
            currentMenu == menu {
            
            return
        }
        
        menu.insertItem(menuItem, at: 0)
    }
    
    func remove() {
        
        menuItem.menu?.removeItem(menuItem)
    }
}

struct SeparatorItem: StatusItem {
    
    let menuItem = NSMenuItem.separator()
}
