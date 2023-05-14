//
//  ChangeManualFields.swift
//  MentorsJoy
//

protocol ChangeManualFields {
    
    func setupDownload(download: String)
    func setupLaunch(launch: String)
    func setupTermination(termination: String)
    
    func addTechRequiresItem(item: String)
    func addProgramRequiresItem(item: String)
    func addUserRequiresItem(item: String)
    func addExecutionItem(item: String)
    func addMessagesItem(item: String)
    
    func removeTechRequiresItem(i: Int)
    func removeProgramRequiresItem(i: Int)
    func removeUserRequiresItem(i: Int)
    func removeExecutionItem(i: Int)
    func removeMessagesItem(i: Int)
}
