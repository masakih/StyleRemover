//
//  ClipboardFilter.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/14.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

import AppKit
import Combine

final class ClipboardFilter {
    
    private var observer: AnyCancellable?
    
    init() {
        
        observer = NSWorkspace.shared
            .publisher(for: \.frontmostApplication)
            .sink { ap in
                                
                guard let identifier = ap?.bundleIdentifier else { return }
                guard Configuration().isTargetApplication(identifier) else { return }
                
                filterPasteboard()
        }
    }
}

func noneStyled(_ pType: NSPasteboard.PasteboardType) -> Bool {
    
    let hints = [
        "rtf",
        "NeXT",
        "HTML",
        "Web"
    ]
    
    let pTypeName = pType.rawValue.lowercased()
    
    return hints.map { $0.lowercased() }
        .map { !pTypeName.contains($0) }
        .allSatisfy { $0 }
}

func filterPasteboard() {
    
    let p = NSPasteboard.general
    let original = p.types?.map { ($0, p.data(forType: $0)) }
    
    p.clearContents()
    original?
        .filter { noneStyled($0.0) }
        .forEach { p.setData($0.1, forType: $0.0) }
}
