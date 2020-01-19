//
//  PreferenceItem.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

class PreferenceItem: StatusItem {
    
    let menuItem = NSMenuItem()
    
    private var cancellalbes: [AnyCancellable] = []
    private var panelController = PreferencePanelController()
    
    init() {
        
        menuItem.title = "Preference..."
        menuItem
            .actionPublisher()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: self.showPanel)
            .store(in: &cancellalbes)
    }
    
    private func showPanel(_ item: Any) {
        
        NSApplication.shared.activate(ignoringOtherApps: true)
        panelController.showWindow(nil)
        panelController.window?.makeKeyAndOrderFront(nil)
    }
}
