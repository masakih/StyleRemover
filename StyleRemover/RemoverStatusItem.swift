//
//  RemoverStatusItem.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/26.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

final class RemoverStatusItem: StatusItem {
    
    let menuItem = NSMenuItem()
    
    private var cancellalbes: [AnyCancellable] = []
    
    private var title: String {
        
        UserDefaults.standard.isEnabled ? "\(AppDelegate.appName): On" : "\(AppDelegate.appName): Off"
    }
    
    init() {
        
        menuItem.isEnabled = false
        
        UserDefaults.standard
            .publisher(for: \.isEnabled)
            .sink { _ in self.menuItem.title = self.title }
            .store(in: &cancellalbes)
    }
}
