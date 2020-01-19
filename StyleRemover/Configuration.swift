//
//  Configuration.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Foundation

struct Configuration {
    
    func isTargetApplication(_ identifire: String) -> Bool {
        
        targets.contains(identifire)
    }
    
    private var targets: [String] {
        
        UserDefaults.standard.array(forKey: applicationDataKey) as? [String] ?? []
    }
}
