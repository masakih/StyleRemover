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
        
        UserDefaults.standard.isEnabled ? "Enable" : "Disable"
    }
    
    init() {
        
        menuItem
            .actionPublisher()
            .sink(receiveValue: toggle)
            .store(in: &cancellalbes)
        
        refreshItem()
    }
    
    private func toggle(_: Any) {
        
        UserDefaults.standard.isEnabled.toggle()
        
        refreshItem()
    }
    
    private func refreshItem() {
        
        menuItem.title = title
        menuItem.state = UserDefaults.standard.isEnabled ? .on : .off
    }
}
