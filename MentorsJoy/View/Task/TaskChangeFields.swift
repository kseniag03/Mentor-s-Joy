//
//  TaskChangeFields.swift
//  MentorsJoy
//

extension DocsTask {
    
    func setupDeadlines(deadlines: [String]) {
        if (deadlines.count != 18) {
            return
        }
        self.customDeadlines = deadlines
    }
    
    func addFuncItem(item: String) {
        self.functionality.append(item)
    }
    
    func addInputItem(item: String) {
        self.input.append(item)
    }
    
    func addOutputItem(item: String) {
        self.output.append(item)
    }
    
    func addSafetyItem(item: String) {
        self.safety.append(item)
    }
    
    func addInterfaceItem(item: String) {
        self.interface.append(item)
    }
    
    func addHardwareItem(item: String) {
        self.hardware.append(item)
    }
    
    func addSoftwareItem(item: String) {
        self.software.append(item)
    }
    
    func addSpecialItem(item: String) {
        self.specialReqs.append(item)
    }
}
