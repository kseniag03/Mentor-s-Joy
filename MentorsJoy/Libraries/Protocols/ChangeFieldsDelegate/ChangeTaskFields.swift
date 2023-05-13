//
//  ChangeTaskFields.swift
//  MentorsJoy
//

protocol ChangeTaskFields {
    
    func setupDeadlines(deadlines: [String])
    
    func addFuncItem(item: String)
    func addInputItem(item: String)
    func addOutputItem(item: String)
    func addSafetyItem(item: String)
    func addInterfaceItem(item: String)
    func addHardwareItem(item: String)
    func addSoftwareItem(item: String)
    func addSpecialItem(item: String)
}
