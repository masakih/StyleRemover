//
//  UserDefaults-Extensions.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Foundation
import Combine

let applicationDataKey = "Application Data"

extension UserDefaults {
    
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
