//
//  ManualChangeFields.swift
//  MentorsJoy
//

extension DocsManual {
    
    func setupDownload(download: String) {
        self.download = download
    }
    
    func setupLaunch(launch: String) {
        self.launch = launch
    }
    
    func setupTermination(termination: String) {
        self.termination = termination
    }
    
    func addTechRequiresItem(item: String) {
        self.techRequires.append(item)
    }
    
    func addProgramRequiresItem(item: String) {
        self.programRequires.append(item)
    }
    
    func addUserRequiresItem(item: String) {
        self.userRequires.append(item)
    }
    
    func addExecutionItem(item: String) {
        self.execution.append(item)
    }
    
    func addMessagesItem(item: String) {
        self.messages.append(item)
    }
    
    func removeTechRequiresItem(i: Int) {
        self.techRequires.remove(at: i)
    }
    
    func removeProgramRequiresItem(i: Int) {
        self.programRequires.remove(at: i)
    }
    
    func removeUserRequiresItem(i: Int) {
        self.userRequires.remove(at: i)
    }
    
    func removeExecutionItem(i: Int) {
        self.execution.remove(at: i)
    }
    
    func removeMessagesItem(i: Int) {
        self.messages.remove(at: i)
    }
}
