//
//  Folders.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/19.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import Foundation


struct Folders {
    
    private func folder(_ type: FileManager.SearchPathDirectory) -> URL? {
        
        FileManager.default.urls(for: type, in: .allDomainsMask).first
    }
    
    var applicationFolder: URL? {
        
        folder(.applicationDirectory)
    }
}
