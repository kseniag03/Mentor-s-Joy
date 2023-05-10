//
//  CommonChangeFields.swift
//  MentorsJoy
//

// MARK: change fields values using user's input

protocol ChangeFieldsValue {
    
    func setupPerformerName(name: String)
    
    func setupMentorName(name: String)
    
    func setupYear(year: String)
    
    func setupDate(year: String)
    
    func setupCodifier(code: String, type: DocumentType)
    
    func setupGroup(group: String)
    
    func setupCity(city: String)
    
    func setupProjectTopic(topic: String)
    
    func setupProjectName(name: String)
    
    func setupProjectNameEng(nameEng: String)
    
    func setupShortDecription(description: String)
    
    func setupFunctionPurpose(purpose: String)
    
    func setupExploitPurpose(purpose: String)
    
    func addGlossaryDictItem(key: String, value: String)
    
    func addSourceListItem(item: String)
}

extension DocsCommon {//}: ChangeFieldsValue {
    
    /*

     var year = "2023"
     var date = ""
     
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
        let sortedDict = Dictionary(
            uniqueKeysWithValues: self.glossaryList.sorted(
                by: { $0.key < $1.key }
            )
        )
        self.glossaryList = sortedDict
    }
    
    func addSourceListItem(item: String) {
        self.sourceList.append(item)
        self.sourceList = self.sourceList.sorted()
    }
}
