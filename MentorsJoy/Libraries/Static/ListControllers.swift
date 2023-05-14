//
//  ListControllers.swift
//  MentorsJoy
//

final class ListControllers {
    
    static let default_vc = ListInputViewController(type: .common)
    
    static let sources = ListInputViewController(type: .common)
    static let glossary = ListInputViewController(type: .common)
    
    static let efficiency = ListInputViewController(type: .common)
    static let rivals = ListInputViewController(type: .common)
    static let advantages = ListInputViewController(type: .common)
    
    static let functionality = ListInputViewController(type: .common)
    static let input = ListInputViewController(type: .common)
    static let output = ListInputViewController(type: .common)
    static let safety = ListInputViewController(type: .common)
    static let interface = ListInputViewController(type: .common)
    static let hardware = ListInputViewController(type: .common)
    static let software = ListInputViewController(type: .common)
    
    static let special = ListInputViewController(type:.task)
    static let deadlines = ListInputViewController(type:.task)

    static let put = ListInputViewController(type: .note)
    static let essence = ListInputViewController(type: .note)

    static let params = ListInputViewController(type: .testing)
    static let tools = ListInputViewController(type: .testing)
    static let order = ListInputViewController(type: .testing)
    static let funcCheck = ListInputViewController(type: .testing)
    static let inputCheck = ListInputViewController(type: .testing)
    static let outputCheck = ListInputViewController(type: .testing)
    static let safetyCheck = ListInputViewController(type: .testing)
    static let interfaceCheck = ListInputViewController(type: .testing)
    
    static let techRequires = ListInputViewController(type: .manual)
    static let programRequires = ListInputViewController(type: .manual)
    static let userRequires = ListInputViewController(type: .manual)
    static let execution = ListInputViewController(type: .manual)
    static let messages = ListInputViewController(type: .manual)
    
    static let links = ListInputViewController(type: .programm)
}
