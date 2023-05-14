//
//  ChangeTestingFields.swift
//  MentorsJoy
//

protocol ChangeTestingFields {
    
    func addParamsItem(item: String)
    func addToolsItem(item: String)
    func addOrderItem(item: String)
    func addFuncCheckItem(item: String)
    func addInputCheckItem(item: String)
    
    func addOutputCheckItem(item: String)
    func addSafetyCheckItem(item: String)
    func addInterfaceCheckItem(item: String)
    
    func removeParamsItem(i: Int)
    func removeToolsItem(i: Int)
    func removeOrderItem(i: Int)
    func removeFuncCheckItem(i: Int)
    func removeInputCheckItem(i: Int)
    func removeOutputCheckItem(i: Int)
    func removeSafetyCheckItem(i: Int)
    func removeInterfaceCheckItem(i: Int)
}
