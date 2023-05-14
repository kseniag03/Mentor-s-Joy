//
//  ChangeNoteFields.swift
//  MentorsJoy
//

protocol ChangeNoteFields {
    
    func setupSettingTask(settingTask: String)
    func setupToolsJustification(justification: String)
    
    func addEssenceItem(item: String)
    func addPutItem(item: String)
    
    func removeEssenceItem(i: Int)
    func removePutItem(i: Int)
}
