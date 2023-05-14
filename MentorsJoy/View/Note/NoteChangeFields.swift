//
//  NoteChangeFields.swift
//  MentorsJoy
//


extension DocsNote {
    
    func setupSettingTask(settingTask: String) {
        self.settingTask = settingTask
    }
    
    func setupToolsJustification(justification: String) {
        self.toolsJustification = justification
    }
    
    func addEssenceItem(item: String) {
        self.essence.append(item)
    }
    
    func addPutItem(item: String) {
        self.putData.append(item)
    }
    
    func removeEssenceItem(i: Int) {
        self.essence.remove(at: i)
    }
    
    func removePutItem(i: Int) {
        self.putData.remove(at: i)
    }
}
