//
//  OnOffItem.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/21.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

struct OnOffItem: StatusItem {
    
    let menuItem = NSMenuItem()
    
    private var cancellalbes: [AnyCancellable] = []
    
    private var title: String {
                
        UserDefaults.standard.isEnabled ? "Turn \(AppDelegate.appName) Off" : "Turn \(AppDelegate.appName) On"
    }
    
    init() {
        
        menuItem
            .actionPublisher()
            .sink(receiveValue: toggle)
            .store(in: &cancellalbes)
        
        menuItem.title = title
    }
    
    private func toggle(_: Any) {
        
        UserDefaults.standard.isEnabled.toggle()
        
        menuItem.title = title
    }
}
