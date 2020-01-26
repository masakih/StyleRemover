//
//  LocalizedStrings.swift
//  StyleRemover
//
//  Created by Hori,Masaki on 2020/01/26.
//  Copyright © 2020 Hori,Masaki. All rights reserved.
//

struct LocalizedStrings {}


// MARK: - MenuItems
extension LocalizedStrings {
    
    static let statusOnFormat = LocalizedString("%@: On", comment: "MenunItem: Status On")
    static let statusOffFormat = LocalizedString("%@: Off", comment: "MenunItem: Status Off")
    
    static let turnOnFormat = LocalizedString("Turn %@ On", comment: "MenunItem: Turn On")
    static let turnOffFormat = LocalizedString("Turn %@ Off", comment: "Turn Off")
    
    static let preference = LocalizedString("Preference...", comment: "MenunItem: Preference")
    
    static let quitFormat = LocalizedString("Quit %@", comment: "MenunItem: Quit")
}


// MARK: - Preference
extension LocalizedStrings {
    
    static let choose = LocalizedString("Choose", comment: "Preference: OpenPanel: Choose button")
    static let message = LocalizedString("Chose Target Application", comment: "Preference: OpenPanel: Message")
    
    
}
