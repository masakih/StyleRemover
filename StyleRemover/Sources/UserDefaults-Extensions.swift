//
//  UserDefaults-Extensions.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Foundation
import Combine

private let applicationDataKey = "Application Data"
private let isEnabledKey = "Is Enabled"

extension UserDefaults {
    
    static func setUp() {
        
        UserDefaults.standard.register(defaults:
            [
                applicationDataKey: ["com.apple.TextEdit"],
                isEnabledKey: true,
            ]
        )
    }
    
    @objc dynamic var applicationData: [String] {
        
        get {
            
            array(forKey: applicationDataKey)?
                .compactMap { $0 as? String } ?? []
        }
        
        set {
                        
            set(newValue, forKey: applicationDataKey)
        }
    }
    
    @objc dynamic var isEnabled: Bool {
        
        get {
            
            bool(forKey: isEnabledKey)
        }
        
        set {
            
            set(newValue, forKey: isEnabledKey)
        }
    }
}
