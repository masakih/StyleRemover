//
//  ApplicationDataRow.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Cocoa

class ApplicationDataRow: NSTableCellView {
    
    var applicationData: ApplicationData? {
        
        didSet {
            
            textField?.stringValue = applicationData?.localizedName ?? ""
            imageView?.image = applicationData?.icon
        }
    }
}
