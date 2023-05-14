//
//  TestingChangeFields.swift
//  MentorsJoy
//

extension DocsTesting {
    
    func addParamsItem(item: String) {
        self.params.append(item)
    }
    
    func addToolsItem(item: String) {
        self.tools.append(item)
    }
    
    func addOrderItem(item: String) {
        self.order.append(item)
    }
    
    func addFuncCheckItem(item: String) {
        self.funcCheck.append(item)
    }
    
    func addInputCheckItem(item: String) {
        self.inputCheck.append(item)
    }
    
    func addOutputCheckItem(item: String) {
        self.outputCheck.append(item)
    }
    
    func addSafetyCheckItem(item: String) {
        self.safetyCheck.append(item)
    }
    
    func addInterfaceCheckItem(item: String) {
        self.interfaceCheck.append(item)
    }
    
    func removeParamsItem(i: Int) {
        self.params.remove(at: i)
    }
    
    func removeToolsItem(i: Int) {
        self.tools.remove(at: i)
    }
    
    func removeOrderItem(i: Int) {
        self.order.remove(at: i)
    }
    
    func removeFuncCheckItem(i: Int) {
        self.funcCheck.remove(at: i)
    }
    
    func removeInputCheckItem(i: Int) {
        self.inputCheck.remove(at: i)
    }
    
    func removeOutputCheckItem(i: Int) {
        self.outputCheck.remove(at: i)
    }
    
    func removeSafetyCheckItem(i: Int) {
        self.safetyCheck.remove(at: i)
    }
    
    func removeInterfaceCheckItem(i: Int) {
        self.interfaceCheck.remove(at: i)
    }
}
