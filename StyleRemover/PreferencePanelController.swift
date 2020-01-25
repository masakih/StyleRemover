//
//  PreferencePanelController.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa
import Combine

class PreferencePanelController: NSWindowController {
    
    @IBOutlet private var tableView: NSTableView!
    @IBOutlet private var minusButton: NSButton!
    
    private var applicatins: [ApplicationData] = [] {
        
        didSet { tableView.reloadData() }
    }
    
    private var cancellables: [AnyCancellable] = []
    
    
    override var windowNibName: NSNib.Name? { "PreferencePanel" }
    
    override func windowWillLoad() {
                
        UserDefaults.standard
            .publisher(for: \.applicationData)
            .receive(on: DispatchQueue.main)
            .sink {
                self.applicatins = $0.map(ApplicationData.init)
        }
        .store(in: &cancellables)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        
        window?.center()
        
        tableView.deselectAll(nil)
        minusButton.isEnabled = false
        NotificationCenter.default
            .publisher(for: NSTableView.selectionDidChangeNotification, object: tableView)
            .receive(on: DispatchQueue.main)
            .sink { _ in
                
                if self.tableView.selectedRow < 0 {
                    
                    self.minusButton.isEnabled = false
                }
                else {
                    
                    self.minusButton.isEnabled = true
                }
        }
        .store(in: &cancellables)
    }
    
    
    
    @IBAction private func append(_ sender: Any) {
        
        let openPanel = NSOpenPanel()
        openPanel.directoryURL = Folders().applicationFolder
        openPanel.allowedFileTypes = ["app"]
        
        guard openPanel.runModal() == .OK, let url = openPanel.url else { return }
        guard let identifier = Bundle(url: url)?.bundleIdentifier else { return }
        
        UserDefaults.standard.applicationData += [identifier]
    }
    
    @IBAction private func removeSelection(_ sender: Any) {
        
        guard tableView.selectedRow >= 0 else { return }
                
        UserDefaults.standard.applicationData.remove(at: tableView.selectedRow)
        
        tableView.deselectAll(nil)
        minusButton.isEnabled = false
    }
}

extension PreferencePanelController: NSTableViewDataSource, NSTableViewDelegate {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        applicatins.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "Cell"), owner: nil) as? ApplicationDataRow
        cell?.applicationData = applicatins[row]
        
        return cell
    }
}
