//
//  CommonChangeFields.swift
//  MentorsJoy
//

extension DocsCommon {
    
    func setupPerformerName(name: String) {
        self.performerName = name
    }
    
    func setupMentorName(name: String) {
        self.mentorName = name
    }
    
    func setupYear(year: String) {
        self.year = year
    }
    
    func setupDate(date: String) {
        self.date = date
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
    
    func setupNeed(need: String) {
        self.need = need
    }
    
    func setupKillerFeature(feature: String) {
        self.killerFeature = feature
    }
    
    func addEfficiencyItem(item: String) {
        self.efficiency.append(item)
    }
    
    func addRivalItem(item: String) {
        self.rivals.append(item)
    }
    
    func addAdvantageItem(item: String) {
        self.advantages.append(item)
    }
    
    func addGlossaryDictItem(item: String) {
        /*
        self.glossaryList[key] = value
        let sortedDict = Dictionary(
            uniqueKeysWithValues: self.glossaryList.sorted(
                by: { $0.key < $1.key }
            )
        )
        self.glossaryList = sortedDict*/
        self.glossaryList.append(item)
        self.glossaryList = self.glossaryList.sorted()
    }
    
    func addSourceListItem(item: String) {
        self.sourceList.append(item)
        self.sourceList = Array(self.sourceList[0..<15]) + self.sourceList[15...].sorted { $0 < $1 }
    }
}
