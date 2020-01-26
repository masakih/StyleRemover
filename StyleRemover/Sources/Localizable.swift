//
//  Localizable.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/26.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//


// genstring に対応したローカライズ用プロトコル群
import Foundation

protocol Localizable {
    
    var key: String { get }
    var table: String? { get }
    var comment: String { get }
    
    var string: String { get }
}

extension Localizable {
    
    var string: String {
        
        return NSLocalizedString(key, tableName: table, bundle: .main, comment: comment)
    }
}

struct LocalizedString: Localizable {
    
    let key: String
    let table: String? = nil
    let comment: String
    
    
    init(_ string: String, comment: String) {
        
        self.key = string
        self.comment = comment
    }
}

struct LocalizedStringFromTable: Localizable {
    
    let key: String
    let table: String?
    let comment: String
    
    
    init(_ string: String, tableName: String, comment: String) {
        
        self.key = string
        self.table = tableName
        self.comment = comment
    }
}
