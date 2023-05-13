//
//  PDFVCChangeCommon.swift
//  MentorsJoy
//

extension PDFViewController: ChangeCommonFields {
    
    func setupPerformerName(name: String) {
        allDocuments.forEach { doc in
            doc.setupPerformerName(name: name)
        }
    }
    
    func setupMentorName(name: String) {
        allDocuments.forEach { doc in
            doc.setupMentorName(name: name)
        }
    }
    
    func setupYear(year: String) {
        allDocuments.forEach { doc in
            doc.setupYear(year: year)
        }
    }
    
    func setupDate(date: String) {
        allDocuments.forEach { doc in
            doc.setupDate(date: date)
        }
    }
    
    func setupCodifier(code: String) {
        allDocuments.forEach { doc in
            doc.setupCodifier(code: code, type: self.type)
        }
    }
    
    func setupGroup(group: String) {
        allDocuments.forEach { doc in
            doc.setupGroup(group: group)
        }
    }
    
    func setupCity(city: String) {
        allDocuments.forEach { doc in
            doc.setupCity(city: city)
        }
    }
    
    func setupProjectTopic(topic: String) {
        allDocuments.forEach { doc in
            doc.setupProjectTopic(topic: topic)
        }
    }
    
    func setupProjectName(name: String) {
        allDocuments.forEach { doc in
            doc.setupProjectName(name: name)
        }
    }
    
    func setupProjectNameEng(nameEng: String) {
        allDocuments.forEach { doc in
            doc.setupProjectNameEng(nameEng: nameEng)
        }
    }
    
    func setupShortDecription(description: String) {
        allDocuments.forEach { doc in
            doc.setupShortDecription(description: description)
        }
    }
    
    func setupFunctionPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupFunctionPurpose(purpose: purpose)
        }
    }
    
    func setupExploitPurpose(purpose: String) {
        allDocuments.forEach { doc in
            doc.setupExploitPurpose(purpose: purpose)
        }
    }
    
    func setupNeed(need: String) {
        allDocuments[0].setupNeed(need: need)
        allDocuments[1].setupNeed(need: need)
    }
    
    func setupKillerFeature(feature: String) {
        allDocuments[0].setupKillerFeature(feature: feature)
        allDocuments[1].setupKillerFeature(feature: feature)
    }
    
    func addEfficiencyItem(item: String) {
        allDocuments[0].addEfficiencyItem(item: item)
        allDocuments[1].addEfficiencyItem(item: item)
    }
    
    func addRivalItem(item: String) {
        allDocuments[0].addRivalItem(item: item)
        allDocuments[1].addRivalItem(item: item)
    }
    
    func addAdvantageItem(item: String) {
        allDocuments[0].addAdvantageItem(item: item)
        allDocuments[1].addAdvantageItem(item: item)
    }
    
    func addGlossaryDictItem(item: String) {
        allDocuments.forEach { doc in
            doc.addGlossaryDictItem(item: item)
        }
    }
    
    func addSourceListItem(item: String) {
        allDocuments.forEach { doc in
            doc.addSourceListItem(item: item)
        }
    }
}
