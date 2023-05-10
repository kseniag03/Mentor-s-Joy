//
//  CommonChangeFields.swift
//  MentorsJoy
//

// MARK: change fields values using user's input

extension DocsCommon {
    
    /*
     
     
     var year = "2023"
     var date = ""

     var glossaryList: [String: String] = [:]
     var sourceList: [String] = []
     
     
     */
    
    func setupPerformerName(name: String) {
        self.performerName = name
    }
    
    func setupMentorName(name: String) {
        self.mentorName = name
    }
    
    func setupYear(year: String) {
        self.year = year
    }
    
    func setupDate(year: String) {
        self.date = year
    }
    
    func setupCodifier(code: String, type: DocumentType) {
        var newCodifier = codifier.replacingOccurrences(of: "XX.XX", with: code)
        switch type {
        case .task:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТЗ")
        case .note:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПЗ")
        case .testing:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ПМИ")
        case .manual:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "РП")
        case .programm:
            newCodifier = newCodifier.replacingOccurrences(of: "X", with: "ТП")
        }
        codifier = newCodifier
    }
    
    func setupGroup(group: String) {
        self.group = group
    }
    
    func setupCity(city: String) {
        self.city = city
    }
    
    func setupProjectTopic(topic: String) {
        self.projectTopic = topic
    }
    
    func setupProjectName(name: String) {
        self.projectName = name
    }
    
    func setupProjectNameEng(nameEng: String) {
        self.projectNameEng = nameEng
    }
    
    func setupShortDecription(description: String) {
        self.shortDecription = description
    }
    
    func setupFunctionPurpose(purpose: String) {
        self.functionPurpose = purpose
    }
    
    func setupExploitPurpose(purpose: String) {
        self.exploitPurpose = purpose
    }
    
    func addGlossaryDictItem(key: String, value: String) {
        self.glossaryList[key] = value
        //self.glossaryList = self.glossaryList.sorted(using: .localized)
    }
    
    func addSourceListItem(item: String) {
        self.sourceList.append(item)
        self.sourceList = self.sourceList.sorted()
    }
}
