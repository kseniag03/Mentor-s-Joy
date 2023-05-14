//
//  ChangeDocsCommonFields.swift
//  MentorsJoy
//

// MARK: change fields values using user's input

protocol ChangeCommonFields {
    
    func setupPerformerName(name: String)
    func setupMentorPost(post: String)
    func setupMentorName(name: String)
    func setupYear(year: String)
    func setupDate(date: String)
    func setupCodifier(code: String)
    func setupGroup(group: String)
    func setupCity(city: String)
    func setupProjectTopic(topic: String)
    func setupProjectName(name: String)
    func setupProjectNameEng(nameEng: String)
    
    func setupShortDecription(description: String)
    func setupFunctionPurpose(purpose: String)
    func setupExploitPurpose(purpose: String)
    func setupNeed(need: String)
    func setupKillerFeature(feature: String)
    
    func addFuncItem(item: String)
    func addInputItem(item: String)
    func addOutputItem(item: String)
    func addSafetyItem(item: String)
    func addInterfaceItem(item: String)
    func addHardwareItem(item: String)
    func addSoftwareItem(item: String)
    
    func addEfficiencyItem(item: String)
    func addRivalItem(item: String)
    func addAdvantageItem(item: String)
    func addGlossaryDictItem(item: String)
    func addSourceListItem(item: String)
    
    func removeFuncItem(i: Int)
    func removeInputItem(i: Int)
    func removeOutputItem(i: Int)
    func removeSafetyItem(i: Int)
    func removeInterfaceItem(i: Int)
    func removeHardwareItem(i: Int)
    func removeSoftwareItem(i: Int)
    
    func removeEfficiencyItem(i: Int)
    func removeRivalItem(i: Int)
    func removeAdvantageItem(i: Int)
    func removeGlossaryDictItem(i: Int)
    func removeSourceListItem(i: Int)
}
