//
//  ChangeDocsCommonFields.swift
//  MentorsJoy
//

// MARK: change fields values using user's input

protocol ChangeCommonFields {
    
    func setupPerformerName(name: String)
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
    
    func addEfficiencyItem(item: String)
    func addRivalItem(item: String)
    func addAdvantageItem(item: String)
    func addGlossaryDictItem(item: String)
    func addSourceListItem(item: String)
}

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

protocol ChangeNoteFields {
    
    
}

protocol ChangeTestingFields {
    
    
}

protocol ChangeManualFields {
    
    
}

protocol ChangeProgramFields {
    
}
