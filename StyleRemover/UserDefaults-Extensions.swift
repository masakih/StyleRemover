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
private let isEnablbedKey = "Is enabled"

extension UserDefaults {
    
    static func setUp() {
        
        UserDefaults.standard.register(defaults:
            [
                applicationDataKey: ["com.apple.TextEdit"],
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
}
