//
//  ChangeTaskFields.swift
//  MentorsJoy
//

protocol ChangeTaskFields {
    
    func addSpecialItem(item: String)
    func addDeadline(deadline: String)
    
    func removeSpecialItem(i: Int)
    func removeDeadline(i: Int)
}
